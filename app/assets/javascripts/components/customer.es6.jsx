class Customer extends React.Component {
  render () {
    return (
      <div>
        <p>
          <strong>Identification: </strong>
          { this.props.customer.identification }
        </p>
        <p>
          <strong>First name: </strong>
          { this.props.customer.first_name }
        </p>
        <p>
          <strong>Last name: </strong>
          { this.props.customer.last_name }
        </p>
        <p>
          <strong>Address: </strong>
          { this.props.customer.address }
        </p>
        <p>
          <strong>Phone: </strong>
          { this.props.customer.phone }
        </p>
        <p>
          <strong>Gender: </strong>
          { this.props.customer.gender }
        </p>
        <p>
          <strong>Employee: </strong>
          { this.props.employee_name }
        </p>
        <p>
          <strong>Debt: </strong>
          { this.props.debt }
        </p>
      </div>
    );
  }
}
