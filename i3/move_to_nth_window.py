import sys
import subprocess

def get_command_output(cmd):
    return subprocess.check_output(cmd.split(" ")).decode("utf-8").strip()
def get_windows_on_desktop():
    window_info = get_command_output("wmctrl -l")
    window_ids = []
    for w in window_info.splitlines():
        w_info = list(filter(None, w.split(" ")))
        print(w_info)
        if int(w_info[1]) > -1:
                window_ids.append(w_info[0])

    return window_ids
def move_to_window(window_id):
    subprocess.check_output(("wmctrl -ia %s" %window_id).split(" "))



windows = get_windows_on_desktop()
new_window = windows[int(sys.argv[1])]
move_to_window(new_window)
