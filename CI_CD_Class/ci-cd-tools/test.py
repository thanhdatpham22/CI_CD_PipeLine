import time
import serial

def send_cmd(ser, cmd):
    # Luôn gửi kèm \r\n ở cuối lệnh
    ser.write((cmd + "\r\n").encode("utf-8"))
    time.sleep(0.1)
    response = ser.read_all().decode("utf-8", errors="ignore")
    return response


# Kết nối Serial
ser = serial.Serial("COM16", 115200, timeout=1)  # Đổi COM3 thành cổng của bạn

# 1. Test Version
res = send_cmd(ser, "version")
print("Version Response:", res)

res = send_cmd(ser, "help")
print("Version Response:", res)

# 2. Config & Write Pin A5
send_cmd(ser, "dc A 5 o pushpull")
res_write = send_cmd(ser, "dw A 5 1")
assert "OK" in res_write

# 3. Read Pin C13
send_cmd(ser, "dc C 13 i up")
res_read = send_cmd(ser, "dr C 13")
print("Read Pin C13:", res_read)

ser.close()