const data = [
  {
    ckey: "max-users",
    value: 4096
  },
  {
    ckey: "min-users",
    value: 1024
  },
  {
    ckey: "max-instances",
    value: 10
  },
  {
    ckey: "min-instances",
    value: 5
  }  
];
  

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
  render(){
    return (
      <table className="table">
        <thead>
          <tr>
            <th scope="col">Key</th>
            <th scope="col">Value</th>
          </tr>
        </thead>
        <tbody>
          
            {data.map(item=><Row ckey={item.ckey} value={item.value} />)}
          
        </tbody>
      </table>
    )
  }
}

ReactDOM.render(
  <Table />, document.getElementById("root")
);