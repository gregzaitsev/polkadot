Description: Disputes initiation, conclusion and lag
Network: ./0002-parachains-disputes.toml
Creds: config

alice: is up
bob: is up
charlie: is up
dave: is up
eve: is up
ferdie: is up

# Check authority status and peers.
alice: reports node_roles is 4
bob: reports node_roles is 4
charlie: reports node_roles is 4
dave: reports node_roles is 4
eve: reports node_roles is 4
ferdie: reports node_roles is 4

# Ensure parachains are registered.
alice: parachain 2000 is registered within 60 seconds
bob: parachain 2001 is registered within 60 seconds
charlie: parachain 2002 is registered within 60 seconds
dave: parachain 2003 is registered within 60 seconds

alice: reports peers count is at least 7 within 15 seconds
bob: reports peers count is at least 7 within 15 seconds
charlie: reports peers count is at least 7 within 15 seconds
dave: reports peers count is at least 7 within 15 seconds
ferdie: reports peers count is at least 7 within 15 seconds
eve: reports peers count is at least 7 within 15 seconds

# Ensure parachains made progress.
alice: parachain 2000 block height is at least 10 within 300 seconds
bob: parachain 2001 block height is at least 10 within 300 seconds

# Check if disputes are initiated and concluded.
# TODO: check if disputes are concluded faster than initiated.
eve: reports parachain_candidate_disputes_total is at least 10 within 15 seconds
eve: reports parachain_candidate_dispute_concluded{validity="valid"} is at least 10 within 15 seconds
eve: reports parachain_candidate_dispute_concluded{validity="invalid"} is 0 within 15 seconds

# Check lag - approval
alice: reports polkadot_parachain_approval_checking_finality_lag is 0
bob: reports polkadot_parachain_approval_checking_finality_lag is 0
charlie: reports polkadot_parachain_approval_checking_finality_lag is 0
dave: reports polkadot_parachain_approval_checking_finality_lag is 0
ferdie: reports polkadot_parachain_approval_checking_finality_lag is 0
eve: reports polkadot_parachain_approval_checking_finality_lag is 0

# Check lag - dispute conclusion
alice: reports polkadot_parachain_disputes_finality_lag is 0
bob: reports polkadot_parachain_disputes_finality_lag is 0
charlie: reports polkadot_parachain_disputes_finality_lag is 0
dave: reports polkadot_parachain_disputes_finality_lag is 0
ferdie: reports polkadot_parachain_disputes_finality_lag is 0
eve: reports polkadot_parachain_disputes_finality_lag is 0
