import React from 'react';
import ReactDOM from 'react-dom';




/******************************************************
********** BASIC COMPONENTS  **************************
*******************************************************/

// MUST: <div> as a root html tag
class ShoppingList extends React.Component {
  render() {
    return (
      <div className="shopping-list"> // jsx >>> className == class
        <h1>Shopping List for {this.props.name}</h1>
      </div>
    );
  }
}


ReactDOM.render(
// <React component/>, root div where component will be rendered
  <ShoppingList />, document.getElementById("root")
);

// Example usage: <ShoppingList name="Mark" />

/******************************************************
********** CONSTRUCTOR & STATE  ***********************
*******************************************************/

class Square extends React.Component {
  constructor(props) {
    super(props); // MUST PUT IT
    this.state = {
      value: null
    };
  }
  render() {
    return (
      <button className="square" onClick={() => this.setState({value: "X"})}>
        {this.state.value}
      </button>
    );
  }
}


class Board extends React.Component {
  renderSquare(i) {
    return <Square value={i} />; // using props
  }
  render() {
    const status = 'Next player: X';
    return (
      <div>
        <div className="board-row">
          {this.renderSquare(0)}
        </div>
      </div>
    );
  }
}


/******************************************************
********** LOOP COMPONENT  ****************************
*******************************************************/

class List extends React.Component{
  render(){
    const topicList = ["HTML", "Javascript", "React"];
    return (
      <div>
        <ul>
          {topicList.map(topic => <li>{topic}</li>)}
        </ul>
      </div>
    )
  }
}

/******************************************************
********** ONCLICK   **********************************
*******************************************************/
class Link extends React.Component{
  render(){
    return (
      <a href="#" onClick={this._makeCall.bind(this)}></a>
    )
  }
  
  _makeCall(event){
    event.preventDefault();
    window.location.href = "http://www.google.com";
  }
}




/******************************************************
********** FUNCTIONAL COMPONENTS  *********************
*******************************************************/

function Square(props) {
  return (
    <button className="square" onClick={props.onClick}>
      {props.value}
    </button>
  );
}




