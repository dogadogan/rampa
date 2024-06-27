from movement_primitives.dmp import DMP
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




d = DMP(n_dims=n_dims, n_weights_per_dim=20)

Y = posdata.reshape((number_of_demonstrations,sample_lenght,n_dims))
Ts = np.linspace(0,1,sample_lenght).reshape(sample_lenght)


# Bu teker teker aliyor train olurken o yuzden loop var

for i, traj in enumerate(Y):
    # INPUTS
    # T : array, shape (n_steps,) Time for each step.
    # Y : array, shape (n_steps, n_dims) State at each step.
    d.imitate(T=Ts, Y = traj)

# Cok farkli sekillerde condition edilebiliyor, bir inceleyin bence kodunu
d.configure(start_y=Y[0,0], goal_y=Y[0,-1])
t, trajectory_p = d.open_loop()

# 101 nokta cikariyor neden anlamadim
t = t[:100]
trajectory_p = trajectory_p[:100]

# Burasi tek trajectory icin
plt.plot(t[:],trajectory_p[:,0],label='Generated')
plt.plot(Ts[:],Y[0,:,0],label='True')
plt.title("X axis")
plt.legend()
plt.show()


plt.plot(t[:],trajectory_p[:,1],label='Generated')
plt.plot(Ts[:],Y[0,:,1],label='True')
plt.title("Y axis")
plt.legend()
plt.show()


plt.plot(t[:],trajectory_p[:,2],label='Generated')
plt.plot(Ts[:],Y[0,:,2],label='True')
plt.title("Z axis")
plt.legend()
plt.show()



