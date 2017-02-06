#collaborative filtering 
basetable <- read.csv("/Users/tscheys/Google\ Drive/collabFilter/ml-100k/u.data")

#put basetable headers naming, put separation

#lookup formulas for collab filtering 

#check how basetable needs to look

#k = number of features we want 
k = 5
i = nrow(y) 
j = ncol(y)
#make matrix from basetable  

#initialiseerd beta vector voor alle users met random waarden
beta = matrix(nrow = j, ncol = k)
x = matrix(nrow = i, ncol = k)

#initialiseer feature vector voor elke movie met random waarden
  # check rows and cols in rating matrix 
  # rows number of feature vectors
  # cols number of beta vectors 


# simultaan updaten van waarden 
# J = (som van theta user j x feature vector van movie i) - y (score user j gave movie i, if exists)

# grad theta = theta - alpha * SOM ((van theta user j x feature vector van movie i) - y (score user j gave movie i, if exists)) * xi

# grad x = x - alpha * SOM ((van theta user j x feature vector van movie i) - y (score user j gave movie i, if exists)) * betai