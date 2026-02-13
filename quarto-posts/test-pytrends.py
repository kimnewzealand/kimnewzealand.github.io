from pytrends.request import TrendReq

# Check available methods
pytrends = TrendReq(hl='en-NZ', tz=360)
methods = [m for m in dir(pytrends) if not m.startswith('_')]
print("Available methods:")
print(methods)

# Try to fetch data
try:
    print("\nTrying build_payload...")
    pytrends.build_payload(kw_list=['data scientist'], timeframe='2021-02-13 2026-02-13', geo='NZ')
    df = pytrends.interest_over_time()
    print("Success!")
    print(df.head())
except Exception as e:
    print(f"Error: {e}")

