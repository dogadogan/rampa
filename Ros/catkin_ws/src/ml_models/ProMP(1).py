from movement_primitives.promp import ProMP
import numpy as np
import matplotlib.pyplot as plt


# MOCK DATA
x = np.sin(np.linspace(0,np.pi,100)).reshape(100,1)
y = np.cos(np.linspace(0,np.pi,100)).reshape(100,1)
z = np.linspace(0,1,100).reshape(100,1)
posdata = np.concatenate((x,y,z),axis=-1)
sample_lenght = 100
number_of_demonstrations = 1
n_dims = 3

# REAL DATA
# posdata = np.load('PATH') # Assuming dimensions (n_demos, sample_lenght, n_dims)
# number_of_demonstrations = posdata.shape[0]
# sample_lenght = posdata.shape[1]
# n_dims = posdata.shape[2]


p = ProMP(n_dims=n_dims,n_weights_per_dim=20) # n_dim kac kullanilacaksa, yanindaki cok onemli degil
# INPUT soyle olmali = Ts : array, shape (n_demos, n_steps), Ys : array, shape (n_demos, n_steps, n_dims)

# Time normalized olmali
Ts = np.linspace(0,1,sample_lenght).reshape((number_of_demonstrations,sample_lenght)) # (n_demos, n_steps)

# Y de istenen sekilde olmali
Ys = posdata.reshape((number_of_demonstrations,sample_lenght,n_dims)) # (n_demos, n_steps, n_dims)

# Burada train oluyor
p.imitate(Ts,Ys)

# Condition point indexi
condition_point_index = 15

# Condition the ProMP - Bu noktayi input kullanarak trajectory generate edecek
p = p.condition_position(Ys[0,condition_point_index],t=Ts[0,condition_point_index])

# TRAJECTOY GENERATION
# INPUTS : T : array-like, shape (n_steps,) :  Time steps
#          n_samples : int  : Number of trajectories that will be sampled
# random state onemsiz
trajectory_p = p.sample_trajectories(T=Ts.reshape(sample_lenght), n_samples=1, random_state=np.random.RandomState(seed=1234))


# Burasi tek trajectory icin
plt.plot(Ts[0,:],trajectory_p[0,:,0],label='Generated')
plt.plot(Ts[0,:],Ys[0,:,0],label='True')
plt.title("X axis")
plt.legend()
plt.show()


plt.plot(Ts[0,:],trajectory_p[0,:,1],label='Generated')
plt.plot(Ts[0,:],Ys[0,:,1],label='True')
plt.title("Y axis")
plt.legend()
plt.show()


plt.plot(Ts[0,:],trajectory_p[0,:,2],label='Generated')
plt.plot(Ts[0,:],Ys[0,:,2],label='True')
plt.title("Z axis")
plt.legend()
plt.show()
