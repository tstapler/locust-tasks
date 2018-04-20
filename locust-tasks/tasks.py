#!/usr/bin/env python

from locust import HttpLocust, TaskSet, task
import requests

h = {"Host": "sample-host.com"}

requests.packages.urllib3.disable_warnings()

class SimpleLocustTest(TaskSet):
    @task
    def get_something(self):
        self.client.get("/index.thml", headers=h, verify=False)

class LocustTests(HttpLocust):
    task_set = SimpleLocustTest
