# pragma version 0.4.0

owner: public(address)
name: public(String[100])
expire: public(uint256)

@deploy
def __init__(name: String[100], duration: uint256):
    self.owner = msg.sender
    self.name = name
    self.expire = block.timestamp + duration