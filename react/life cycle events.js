// https://medium.com/@baphemot/understanding-reactjs-component-life-cycle-823a640b3e8d

class Base extends React.Component{
  
  componentWillMount(){
    alert("componentWillMount()");
  }
  
  componentDidMount(){
    alert("componentDidMount()");
  }
  
  componentWillUnmount(){
    alert("componentWillUnmount()");
  }
  
  render(){
    return (
      <div className="alert alert-success" role="alert">
        Component rendered!
      </div>
    )
  }
}


ReactDOM.render(
  <Base />, document.getElementById("root")
)