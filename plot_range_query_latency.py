import matplotlib.pyplot as plt
import numpy as np

# Data from experiments
datasets = ['Uniform', 'Skewed']
indexed_times = [176.075, 220.799]
no_index_times = [257.993, 74.500]

x = np.arange(len(datasets))
width = 0.35

plt.figure(figsize=(8, 5))

plt.bar(x - width/2, indexed_times, width, label='Indexed')
plt.bar(x + width/2, no_index_times, width, label='No Index')

plt.xlabel('Dataset Type')
plt.ylabel('Execution Time (ms)')
plt.title('Indexed vs Non-Indexed Range Query Latency')
plt.xticks(x, datasets)
plt.legend()

plt.tight_layout()
plt.show()
