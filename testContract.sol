contract LexingtonBase {
    event LexingtonContractCreated(string contractType, address originatingAddress);
    event LexingtonContractUpdated(string contractType, string action, address originatingAddress);
    
    string internal ContractType;

    function LexingtonBase(string contractType) internal {
        ContractType = contractType;
    }

    function ContractCreated() internal {
        LexingtonContractCreated(ContractType, msg.sender);
    }

    function ContractUpdated(string action) internal {
        LexingtonContractUpdated(ContractType, action, msg.sender);
    }
}

contract AppBuilderTestContract is LexingtonBase('AppBuilderTestContract') {
    enum ContractState { Created, Active, Complete, Terminated }
    address public Owner;
    string public Description;    
    ContractState public State;

    function AppBuilderTestContract(string description){
        Owner = msg.sender;
        Description = description;
        State = ContractState.Active;
        ContractCreated();
    }
}