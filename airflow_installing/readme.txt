2.7.3 Airflow

mkdir airflow
chmod 777 airflow
export AIRFLOW_HOME=/airflow
printenv

pip3 install apache-airflow[postgresql,kubernetes]==2.7.3
pip3 install psycopg2-binary
pip3 install Flask-Session==0.5.0

airflow config list

sudo -u postgres psql
postgres=# create database airflow_metadata;
postgres=# CREATE USER airflow1 WITH password 'qwerty12345';
postgres=# grant all privileges on database airflow_metadata to airflow1;

executor = LocalExecutor
sql_alchemy_conn = postgresql+psycopg2://airflow1:qwerty12345@localhost/airflow_metadata


airflow db init

airflow users create --username AirflowAdmin --firstname name1 --lastname name2 --role Admin --email airflow@airflow.com
qwerty


airflow scheduler
airflow webserver


http://194.87.102.3:8080

создать папки для дагов, плагинов и скриптов


/etc/sysconfig/    - сюда файл airflow - с переменными окружения
cd /etc
mkdir sysconfig
chmod 777 -R sysconfig

/usr/lib/systemd/system/   - сюда файлы демонов


systemctl daemon-reload

systemctl enable airflow-scheduler
systemctl restart airflow-scheduler
systemctl status airflow-scheduler

systemctl enable airflow-webserver
systemctl restart airflow-webserver
systemctl status airflow-webserver