from PIL import Image, ImageTk
import tkinter as tk
import os

os.path.join(__file__,"..\\")


img_add = [['s01.jpg','s02.jpg','s03.jpg'],
           ['s04.jpg','s05.jpg','s06.jpg']]

window = tk.Tk()

for i in range(2):
    for j in range(3):
        frame = tk.Frame(
            master=window,
            # relief=tk.RAISED,
            borderwidth=1
        )
        frame.grid(row=i, column=j)
        
        # label = tk.Label(master=frame, text=f"Row {i}\nColumn {j}")
        img = ImageTk.PhotoImage(Image.open(img_add[i][j]))
        label = tk.Label(master=frame, image=img)
        label.pack()
        # window.mainloop()

window.mainloop()