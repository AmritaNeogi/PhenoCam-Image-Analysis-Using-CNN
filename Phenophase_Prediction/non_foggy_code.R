
# install required packages and load libraries
# install.packages('hazer')
# install.packages('jpeg')
# install.packages("data.table")

library(hazer)
library(jpeg)
library(data.table)

# set up the input image
images_dir <- 'D:/Capstone/data_raw/phenocamdata/NEON.D01.HARV.DP1.00033/2017'

# get a list of all .jpg files in the directory
pointreyes_images <- dir(path = images_dir, 
                         pattern = '*.jpg',
                         recursive = TRUE,
                         ignore.case = TRUE, 
                         full.names = TRUE)
## 1) using a for loop
# number of images
n <- length(pointreyes_images)


# an empty matrix to fill with haze and A0 values
haze_mat <- data.table()

pb <- txtProgressBar(0, n, style = 3)


for(i in 1:n) {
  image_path <- pointreyes_images[i]
  img <- jpeg::readJPEG(image_path)
  haze <- getHazeFactor(img)
  
  
# Extract the desired part of the file path
file_part <- file.path(unlist(strsplit(image_path, "/"))[8:length(strsplit(image_path, "/"))])
  
  
haze_mat <- rbind(haze_mat, 
                    data.table(file = file_part, 
                               haze = haze[1], 
                               A0 = haze[2]))
  
  setTxtProgressBar(pb, i)
}

# Create another CSV file for images with haze factor less than 0.4
fwrite(haze_mat[haze <= 0.4, .(file, haze, A0, foggy = FALSE)], 
       "C:/Users/amrit/OneDrive/Documents/GitHub/PhenoCam-Image-Analysis-Using-CNN/data_out/not_foggy/NEON.D01.HARV.DP1.00033/2017.csv")
