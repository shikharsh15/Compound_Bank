# Decentralised-Banking-Application
The Decentralised Banking Application is a blockchain-based platform designed to revolutionize the banking sector by introducing decentralization and transparency. Built on [insert blockchain platform or technology], this application provides users with the ability to manage their finances securely without the need for intermediaries.

## Running the project locally

If you want to test your project locally, you can use the following commands:

```bash
# Starts the replica, running in the background
dfx start --background

# Deploys your canisters to the replica and generates your candid interface
dfx deploy
```

Once the job completes, your application will be available at `http://localhost:8000?canisterId={asset_canister_id}`.

Additionally, if you are making frontend changes, you can start a development server with

```bash
npm start
```

Which will start a server at `http://localhost:8080`, proxying API requests to the replica at port 8000.


