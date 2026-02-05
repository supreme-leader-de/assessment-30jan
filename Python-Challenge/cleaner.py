import pandas as pd

# read data
cols = [
    "order_id",
    "product",
    "quantity_ordered",
    "price_each",
    "order_date",
    "purchase_address",
    "city",
    "code"
]

df = pd.read_csv("sales_data.csv", names=cols, header=0)

# dealing with nulls and bad data
df = df.dropna(subset=["order_id","product"])
df["quantity_ordered"] = df["quantity_ordered"].astype(int)
df["order_id"] = df["order_id"].astype(int)

df["price_each"] = df.groupby("product")["price_each"].transform(
    lambda x: x.fillna(x.mean())
)

df["order_date"] = pd.to_datetime(df["order_date"], errors="coerce", dayfirst=False)

df.to_csv("cleaned_sales.csv")

# Analysis
# total sales
df["total_sales"] = df["quantity_ordered"] * df["price_each"]
print(df)

# monthly revenur
df["year_month"] = df["order_date"].dt.to_period("M")

monthly_revenue = (
    df.groupby("year_month")["total_sales"].sum().reset_index()
)

print("Monthly Revenue")
print(monthly_revenue)

# best selling product per month
monthly_product_qty = (
    df.groupby(["year_month", "product"])["quantity_ordered"]
      .sum().reset_index()
)

index = monthly_product_qty.groupby("year_month")["quantity_ordered"].idxmax()

best_selling = monthly_product_qty.iloc[index]

print("Best Selling products per month")
print(best_selling)