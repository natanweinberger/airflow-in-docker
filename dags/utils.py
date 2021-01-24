''' Utility functions for DAGs and tasks. '''

def is_running_in_airflow(name) -> bool:
    return name.startswith('unusual_prefix')
