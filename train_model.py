
import tensorflow as tf
import numpy as np

# Dummy dataset: [shift_start_hour, shift_end_hour] -> recommended_sleep_start
data = np.array([
    [8, 16], [16, 24], [0, 8], [9, 17], [22, 6]
])
labels = np.array([22, 6, 14, 23, 8])  # Sleep start times

# Model definition
model = tf.keras.Sequential([
    tf.keras.layers.Dense(16, activation='relu', input_shape=(2,)),
    tf.keras.layers.Dense(8, activation='relu'),
    tf.keras.layers.Dense(1)
])

model.compile(optimizer='adam', loss='mse')

# Train the model
model.fit(data, labels, epochs=100)

# Save the model
model.save("sleep_schedule_model.h5")
