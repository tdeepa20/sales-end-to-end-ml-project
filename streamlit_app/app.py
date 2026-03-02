import streamlit as st
import joblib
import numpy as np

st.set_page_config(page_title="Sales Prediction App", layout="wide")

# Load model
model = joblib.load("sales_model.pkl")

st.title("Sales Revenue Prediction App")
st.markdown("Predict sales using trained Random Forest model")

st.divider()

col1, col2 = st.columns(2)

with col1:
    quantity = st.number_input("Quantity Ordered", min_value=1)
    price = st.number_input("Price Each", min_value=1.0)
    msrp = st.number_input("MSRP", min_value=1.0)

with col2:
    quarter = st.selectbox("Quarter", [1, 2, 3, 4])
    month = st.selectbox("Month", list(range(1, 13)))
    year = st.selectbox("Year", [2003, 2004, 2005])

st.divider()

if st.button("Predict Sales"):
    input_data = np.array([[quantity, price, quarter, month, year, msrp]])
    prediction = model.predict(input_data)
    
    st.success(f"Predicted Sales: ₹ {round(prediction[0], 2)}")
