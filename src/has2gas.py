import re
import sys

def convert_line(line):
    if not line.strip():
        return line

    # 1. Convert string literals ('...') to CP932 hex sequences first.
    def str_replacer(match):
        s = match.group(1)
        try:
            b_data = s.encode('cp932')
            return ','.join([f'0x{b:02x}' for b in b_data])
        except UnicodeEncodeError:
            sys.stderr.write(f"Error: Cannot encode '{s}' to CP932\n")
            sys.exit(1)

    line = re.sub(r"'(.*?)'", str_replacer, line)

    # 2. Separate the comment part from the code part.
    comment_split = re.split(r'(;)', line, maxsplit=1)
    code_part = comment_split[0]
    comment_part = "".join(comment_split[1:])

    # 3. Process the code part.
    
    # Convert Data Definition directives (case-insensitive)
    # .dc.b -> .byte
    code_part = re.sub(r'\.dc\.b', '.byte', code_part, flags=re.IGNORECASE)
    # .dc.w -> .short
    code_part = re.sub(r'\.dc\.w', '.short', code_part, flags=re.IGNORECASE)
    # .dc.l -> .long
    code_part = re.sub(r'\.dc\.l', '.long', code_part, flags=re.IGNORECASE)
    
    # Convert $xx (Motorola hex) to 0xXX (GAS hex)
    code_part = re.sub(r'\$([0-9a-fA-F]+)', r'0x\1', code_part)
    
    # Remove leading underscores from labels and .globl directives
    code_part = re.sub(r'(^|\s|(?<=\.globl\s))_([a-zA-Z0-9_]+)', r'\1\2', code_part)
    
    # Comment out .end directive
    code_part = re.sub(r'^\s*\.end', '# .end', code_part, flags=re.IGNORECASE)

    # 4. Process the comment part.
    if comment_part.startswith(';'):
        comment_part = '#' + comment_part[1:]

    return code_part + comment_part

if __name__ == "__main__":
    try:
        input_data = sys.stdin.read().splitlines()
        for line in input_data:
            sys.stdout.write(convert_line(line) + '\n')
    except Exception as e:
        sys.stderr.write(f"Runtime Error: {e}\n")
        sys.exit(1)