import os
import glob
import locale
import subprocess
import pandas as pd
import seaborn as sns
import matplotlib as mpl
import matplotlib.pyplot as plt

locale.setlocale(locale.LC_ALL, "de_DE")
mpl.rcParams['axes.formatter.use_locale'] = True
sns.set_context("paper")

app_dir = os.path.dirname(os.path.realpath(__file__))
print(app_dir)
print("Benchmarking…")
subprocess.call(app_dir + "/demo")

fig = plt.figure()
ax = fig.add_subplot(111)

for i in [["IS", "Insertion Sort", "r"], ["QS", "QuickSort", "g"], ["RS", "RadixSort", "b"]]:
		print("Plotting…")
		data = pd.io.parsers.read_csv(
			app_dir + "/testData/" + i[0] + ".csv", names=["x", "y"], header=None)
		ax.scatter(data["x"], data["y"], s=1, c=i[2], lw=0, label=i[1])

ax.set_xlabel("Wiederholungen")
ax.set_ylabel("Zeit in s")
ax.set_xlim(0, 5000)
ax.set_ylim(0)
fig.savefig(app_dir + "/plot.png", bbox_inches='tight', dpi=300)
plt.show()
plt.close(fig)
