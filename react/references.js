class Row extends React.Component{
  render(){
    return (
      <tr>
        <td>{this.props.ckey}</td>
        <td>{this.props.value}</td>
      </tr>
    )
  }
}

class Table extends React.Component{
  constructor(){
    super()
    this.state = {
      data: [
        {
          key:"rails/limits/max_instances",
          value: 10
        }
      ]
    }
  }
  

  _getRows(){
    return this.state.data.map((item, index)=>{
      return (<Row key={index} ckey={item.key} value={item.value} />)
    })
  }
  
  _handleButtonClick = (key,value)=>{
    this.setState({
      data: this.state.data.concat([{key,value}])
    });
  }
  
  render(){
    return (
      <div>
        
        <table className="table">
          <thead>
            <tr>
              <th scope="col">Key</th>
              <th scope="col">Value</th>
            </tr>
          </thead>
          <tbody>
            {this._getRows()}
          </tbody>
        </table>
        <Form handleClick={this._handleButtonClick}/>
      </div>
    )
  }
}

class Button extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      message: props.message,
    };
  }

  render(){
    return (
      <button className="btn btn-primary" >{this.state.message}</button>
    )
  }
}

class Form extends React.Component{
  
  _handleSubmit(event){
    event.preventDefault();
    let newKey = this._key;
    let newVal = this._value;
    this.props.handleClick(newKey.value, newVal.value);
  }
  
  render(){
    return (
        <form onSubmit={this._handleSubmit.bind(this)}>
          <div className="row">
            <div className="col">
              <input type="text" className="form-control" ref={(key)=> this._key = key} placeholder="Key"/>
            </div>
            <div className="col">
              <input type="text" className="form-control" ref={(val)=> this._value = val} placeholder="Value"/>
            </div>
            <div className="col">
              <Button message="add data"/>
            </div>
          </div>
        </form>
    )
  }
}


ReactDOM.render(
  <Table />, document.getElementById("root")
);