import subprocess
import time

result = subprocess.run(["sbatch", "hello_abaqus.sh"], capture_output = True, text = True)
job_id = result.stdout.strip().split()[-1]
print(f"Submitted job_id: ", {job_id})

while True:
	squeue = subprocess.run(["squeue", "--job", job_id], capture_output = True, text = True)
	if job_id not in squeue.stdout:
		print("Job completed.")
		break
	time.sleep(10)

print("(Abaqus) job submitted to cluster is finished running - we can continue running the python script now.")
