import dlt
from pyspark.sql.functions import *
from pyspark.sql.functions import col

@dlt.table
def bronze_patient_visits():

    data = [
        (1,"Hyderabad","Cardiology",5200),
        (2,"Bengaluru","Dermatology",2800),
        (3,"Mumbai","Orthopedics",7500)
    ]

    columns = [
        "visit_id",
        "city",
        "specialization",
        "bill_amount"
    ]

    return spark.createDataFrame(data, columns)

@dlt.table
def silver_patient_visits():

    df = dlt.read("bronze_patient_visits")

    return df.filter(
        col("bill_amount").isNotNull()
    ).withColumn(
        "total_bill",
        col("bill_amount") + 500
    )
@dlt.table
def gold_city_revenue():

    df = dlt.read("silver_patient_visits")

    return df.groupBy("city").agg(
        sum("total_bill").alias("city_revenue")
    )
@dlt.table
def gold_specialization_revenue():

    df = dlt.read("silver_patient_visits")

    return df.groupBy("specialization").agg(
        sum("total_bill").alias("specialization_revenue")
    )
