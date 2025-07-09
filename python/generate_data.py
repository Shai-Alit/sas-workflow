import pandas as pd
import numpy as np

# Generate 20 rows of random numbers for 2 columns
data = np.random.rand(20, 2)

# Create a pandas DataFrame with column names
df = pd.DataFrame(data, columns=["first", "second"])

# Display the DataFrame
df.to_csv('../data/process_data.csv',index=False)
