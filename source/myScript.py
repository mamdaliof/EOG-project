import numpy as np
import tkinter as tk
from PIL import Image, ImageTk
import os 
import time

global time_click, sel_mat_col, sel_mat_row, first_page

first_page = 0

time_click = np.zeros((3,3))

def start_func():
    
    global first_page
    start_but.destroy()
    start_label.destroy()
    first_page = 1 
    show_images()

# create a start button
def on_start_button_click():
    global img_idx

    if img_idx + 6 <= len(img_add):
        if img_idx == 0:
            start_button.config(text='Next')
        elif img_idx + 6 == len(img_add):
            start_button.config(text='Finish')
        
        show_images()
    
    else:
        window.destroy()

def my_func(event):
    label = event.widget
    sel_mat_col = label.grid_info()['column']
    sel_mat_row = label.grid_info()['row']
    if label["background"] != 'red':
        label.config(bg='red')
        time_click[sel_mat_row, sel_mat_col] = (time.time() - ref_time)
    else:
        label.config(bg='white')
        time_click[sel_mat_row, sel_mat_col] = -1

def show_images():
    global img_idx
    
    for i in range(3):
        for j in range(3):
            if img_idx < len(img_add):
                var_list[i][j] = ImageTk.PhotoImage(Image.open(img_add[img_idx]))
                label = tk.Label(master=window, image=var_list[i][j])
                label.grid(row=i+1, column=j+1)
                label.bind('<Button-1>', my_func)
                img_idx += 1

# initialize variables
# img_add = ['s01.jpg', 's02.jpg', 's03.jpg', 's04.jpg', 's05.jpg', 's06.jpg',
#            's0201.jpg', 's0202.jpg', 's0203.jpg','s0204.jpg', 's0205.jpg', 's0206.jpg']

img_add = ['img001-11.jpg', 'img001-12.jpg', 'img001-13.jpg', 'img001-21.jpg', 'img001-22.jpg', 'img001-23.jpg','img001-31.jpg', 'img001-32.jpg', 'img001-33.jpg',
           'img001-11.jpg', 'img001-12.jpg', 'img001-13.jpg', 'img001-21.jpg', 'img001-22.jpg', 'img001-23.jpg','img001-31.jpg', 'img001-32.jpg', 'img001-33.jpg']


var_list = [[None, None, None], 
            [None, None, None],
            [None, None, None]]

ref_time = time.time()
img_idx = 0

# create the main window
window = tk.Tk()
window.state('zoomed')

# the first page:
start_label = tk.Label(master=window, text='Please click on the "Start" button to start the test.')
start_label.grid(row=2, column=1)

start_but = tk.Button(master=window, width=10, height=5, text='Start', command=start_func)
start_but.grid(row=3, column=1)

# create the "Next" button
start_button = tk.Button(window, text='Next', width=10, height=5, command=on_start_button_click)

window.mainloop()
