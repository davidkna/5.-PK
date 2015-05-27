import os
import glob
import locale
import subprocess
import sys
import pandas as pd
import seaborn as sns
import matplotlib as mpl
import matplotlib.pyplot as plt

# META
locale.setlocale(locale.LC_ALL, "de_DE")
mpl.rcParams['axes.formatter.use_locale'] = True
sns.set_context("paper")

# Get app dir
app_dir = os.path.dirname(os.path.realpath(__file__))
os.chdir(app_dir)

# Build (if needed)
print("Building…")
subprocess.call(["nim", "c", "-d:release", "demo"])

# Benchmark
print("Benchmarking…")
arg = ""
if len(sys.argv) > 1:
	arg = sys.argv[1]
subprocess.call([app_dir + "/demo", arg])


# Plot
print("Plotting…")
fig = plt.figure()
ax = fig.add_subplot(111)

for i in [["Insertion Sort", "r"], ["QuickSort", "g"], ["Radix LSD Sort", "b"]]:
		print("Plotting " + i[0] + " …")
		data = pd.io.parsers.read_csv(
			app_dir + "/testData/" + i[0] + ".csv", names=["x", "y"], header=None)
		ax.scatter(data["x"], data["y"], s=1, c=i[1], lw=0, label=i[0])

ax.set_xlabel("Wiederholungen")
ax.set_ylabel("Zeit in s")
ax.set_xlim(0, 5000)
ax.set_ylim(0)
fig.savefig(app_dir + "/plot.png", bbox_inches='tight', dpi=300)
plt.show()
plt.close(fig)
