class Pictext extends React.Component {
  render () {
    return (
      <div className="row">
        <div className="col-xl-6 col-xs-6">
          <figure className="figure mt-4">
            <img src={this.props.img_src} className="figure-img img-fluid rounded" alt="No more papers. Use CONDE." />
          </figure>
        </div>
        <div className="col-xl-6 col-xs-6 ">
          <h3 className="mt-4">{this.props.title}</h3>
          <p className="text-justify"> {this.props.text} </p>
          <p className="text-justify"> {this.props.text2} </p>
          <p className="text-justify"> {this.props.text3} </p>
        </div>
      </div>
    );
  }
}
