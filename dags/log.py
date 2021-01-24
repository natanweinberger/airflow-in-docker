from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime
from dags.utils import is_running_in_airflow

def make_dag() -> DAG:
    return DAG('log_timestamp',
               description='Log the current timestamp',
               schedule_interval='* * * * *',
               start_date=datetime(2021, 1, 23),
               catchup=False,
               tags=['logging'])


def main() -> DAG:
    dag = make_dag()

    BashOperator(
        task_id='log_timestamp',
        bash_command='date >> /tmp/timestamps.log',
        dag=dag)

    return dag

if is_running_in_airflow(__name__):
    _ = main()
