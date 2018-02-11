class AlertBox extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      showAlertBox: false,
    };
  }
  
  render(){
    const message = "Misha is the greatest developer ever!"
    let alertBox = <div/>
    let buttonMessage = "Show an Alert Box!"
    
    if(this.state.showAlertBox){
      alertBox = <div className="alert alert-success" role="alert">{message}</div>
      buttonMessage = "Hide an Alert Box!"
    }
    
    return (
      <div>
        <button type="button" className="btn btn-primary"  onClick={()=>this.setState({showAlertBox: !this.state.showAlertBox})} >{buttonMessage}</button>
        {alertBox}ß
      </div>
    )
  }
}

ReactDOM.render(
  <AlertBox />, document.getElementById("root")
);