import tkinter as tk
from PIL import Image, ImageTk

img_add = [['s01.jpg','s02.jpg','s03.jpg'],
           ['s04.jpg','s05.jpg','s06.jpg']]

root = tk.Tk()

frame_image = tk.Frame(master=root, width= 100, height=100)
frame_image.pack()


img = ImageTk.PhotoImage(Image.open(img_add[0][0]))

label_image = tk.Label(master=frame_image, image=img)
label_image.pack()

root.mainloop()

