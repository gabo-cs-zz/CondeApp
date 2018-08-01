class Title extends React.Component {
  render () {
    return (
      <div>
        <h2>{this.props.title}</h2><br />
        <div className="dropdown">
          <a className="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Filter by gender
          </a>
          <div className="dropdown-menu" aria-labelledby="dropdownMenuLink">
            <a className="dropdown-item" href={"/" + this.props.title.toLowerCase()}>All</a>
            <a className="dropdown-item" href={"/" + this.props.title.toLowerCase() + "/?gender=0"}>Male</a>
            <a className="dropdown-item" href={"/" + this.props.title.toLowerCase() + "/?gender=1"}>Female</a>
            <a className="dropdown-item" href={"/" + this.props.title.toLowerCase() + "/?gender=2"}>Undefined</a>
          </div>
        </div>
      </div>
    );
  }
}
