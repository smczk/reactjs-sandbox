import React from 'react'

export default class Main extends React.Component {
  constructor(props) {
    super(props);
    this.state = { name: this.props.name }
  }
  onChangeName(event) {
    let name;
    if(event.target.value == "") {
      name = this.props.name;
    }
    else{
      name = event.target.value;
    }
    this.setState({ name: name });
  }
  render() {
    return(
      <div>
        Hello {this.state.name}!!
        <div><input type="text" placeholder="type your name" onKeyUp={ this.onChangeName.bind(this) } /></div>
      </div>
    );
  }
}
Main.defaultProps = { name: "react" }
