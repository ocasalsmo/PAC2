import plotly.express as px
import pandas as pd

#############################################
# Gantt Chart
#############################################

df = pd.read_csv("Project Management.csv")

df = df[df["Project Type"] != "Other"]

df["Start Date"] = pd.to_datetime(df["Start Date"], format="mixed")
df["End Date"] = pd.to_datetime(df["End Date"], format="mixed")


fig = px.timeline(df, x_start = "Start Date", x_end="End Date", y="Task Name", color="Project Type")
fig.update_yaxes(autorange="reversed")

fig.write_image("GantChart.svg")


#############################################
# 
#############################################