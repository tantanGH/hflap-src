import math

# 設定
sample_rates = [11025, 12000, 22050, 24000, 44100, 48000]
target_freqs = [125, 250, 500, 1000, 2000, 4000, 8000] # 16000HzはサンプルレートによってはNyquist周波数を超えるため除外
shift_bits = 12

#def calculate_biquad_bandpass(freq, fs, q=1.5):
def calculate_biquad_bandpass(freq, fs, q=0.707):
    w0 = 2 * math.pi * freq / fs
    alpha = math.sin(w0) / (2 * q)
    
    # 共通係数
    a0 = 1 + alpha

    # 低域のゲイン調整
    if freq <= 250:
        a0 *= 1.13
    
    # 正規化して算出
    b0 = (alpha) / a0
    b1 = 0 / a0
    b2 = (-alpha) / a0
    a1 = (-2 * math.cos(w0)) / a0
    a2 = (1 - alpha) / a0
    
    return b0, b1, b2, a1, a2

def to_fixed(val, shift=shift_bits):
    return int(round(val * (1 << shift)))


for fs in sample_rates:
    print(f"// --- Coefficients for {fs} Hz ---")
    for f in target_freqs:
        b0, b1, b2, a1, a2 = calculate_biquad_bandpass(f, fs)
        print(f"{{ {to_fixed(b0)}, {to_fixed(b1)}, {to_fixed(b2)}, {to_fixed(a1)}, {to_fixed(a2)} }}, // {f}Hz")
    print()