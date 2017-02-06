#collaborative filtering 
basetable <- read.csv("/Users/tscheys/Google\ Drive/collabFilter/ml-100k/u.data", sep = "\t", header = F)
names(basetable) = c("user_id", "movie_id", "rating", "timestamp")
attach(basetable)
#put basetable headers naming, put separation

#lookup formulas for collab filtering 

#check how basetable needs to look

#k = number of features we want 
k = 5
alpha = 0.005

#for later implementation 
#i = nrow(y) 
#j = ncol(y)

#make matrix from basetable  
#for now we see that 
summary(basetable)
#tells us user id ranges from 1 to 943
#and movie id from 1 to 1628
i = max(movie_id)
j = max(user_id)

#construct y matrix (i, movies are rows, j, users are columns)
y = matrix(0, nrow = i, ncol = j)
#construct identity matrix to check for which user, movie combo we do (1) and do not (0) have a rating
I = matrix(data = 0, nrow = i, ncol = j)

for(s in 1:nrow(basetable)) {
  y[movie_id[s], user_id[s]] = rating[s]
  I[movie_id[s], user_id[s]] = 1
}

#initialiseer beta vector voor alle users met random waarden
#initialiseer feature vector voor elke movie met random waarden
randomThetaVals = rnorm(j*k)
randomXVals = rnorm(i*k)
theta = matrix(randomThetaVals, nrow = j, ncol = k)
x = matrix(randomXVals, nrow = i, ncol = k)

# simultaan updaten van waarden 
# J = (som van theta user j x feature vector van movie i) - y (score user j gave movie i, if exists)
# without regularization 
# x * theta' - y
#create xtheta, is reused in both cost and two gradient functions
Xtheta = (x %*% t(theta)) * I - y

J = 1/2 * sum(Xtheta^2)  
# grad theta = theta - alpha * SOM ((van theta user j x feature vector van movie i) - y (score user j gave movie i, if exists)) * xi
theta = theta - alpha * t(Xtheta) %*% x  
# grad x = x - alpha * SOM ((van theta user j x feature vector van movie i) - y (score user j gave movie i, if exists)) * betai
x = x - alpha * Xtheta %*% theta
#lessons learned: 
#x = matrix(0, nro...) fills in 0 in whole of matrix
#R first multiplies then adds 
