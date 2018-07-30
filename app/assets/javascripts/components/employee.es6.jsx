class Employee extends React.Component {
  render () {
    return (
      <div>
        <p>
          <strong>Identification: </strong>
          { this.props.employee.identification }
        </p>
        <p>
          <strong>First name: </strong>
          { this.props.employee.first_name }
        </p>
        <p>
          <strong>Last name: </strong>
          { this.props.employee.last_name }
        </p>
        <p>
          <strong>Address: </strong>
          { this.props.employee.address }
        </p>
        <p>
          <strong>Phone: </strong>
          { this.props.employee.phone }
        </p>
        <p>
          <strong>Gender: </strong>
          { this.props.employee.gender }
        </p>
        <p>
          <strong>Customers Associated: </strong>
          { this.props.customers_associated }
        </p>
      </div>
    );
  }
}
