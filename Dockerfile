# Start with a base Python 2.7.8 image
FROM python:2.7.8

MAINTAINER Tyler Stapler

# Add nscd to ache DNS
RUN apt-get update && apt-get install -y nscd && rm -rf /var/lib/apt/lists/*

# Add the external tasks directory into /tasks
ADD locust-tasks /locust-tasks

# Install the required dependencies via pip
RUN pip install -r /locust-tasks/requirements.txt

# Expose the required Locust ports
EXPOSE 5557 5558 8089

# Set script to be executable
RUN chmod 755 /locust-tasks/run.sh

# Start Locust using LOCUS_OPTS environment variable
ENTRYPOINT ["/locust-tasks/run.sh"] 
