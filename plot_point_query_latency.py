import matplotlib.pyplot as plt
import numpy as np

# Data from experiments
query_types = [
    "Hot–Uniform",
    "Hot–Skewed",
    "Cold–Uniform",
    "Cold–Skewed"
]

indexed_latency = [0.755, 26.542, 4.138, 2.551]
no_index_latency = [143.830, 275.296, 31.398, 29.912]

# Bar positions
x = np.arange(len(query_types))
width = 0.35

# Plot
plt.figure(figsize=(10, 6))
plt.bar(x - width/2, indexed_latency, width, label="Indexed")
plt.bar(x + width/2, no_index_latency, width, label="No Index")

# Labels and title
plt.xlabel("Query Type")
plt.ylabel("Execution Time (ms)")
plt.title("Indexed vs Non-Indexed Point Query Latency")
plt.xticks(x, query_types)
plt.legend()

# Improve layout
plt.tight_layout()

# Show graph
plt.show()
