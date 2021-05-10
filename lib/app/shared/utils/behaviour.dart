///Estado dos componentes
enum Behaviour {
  ///Behaviour.regular
  regular,

  ///Behaviour.loading
  loading,

  ///Behaviour.error
  error,

  ///Behaviour.empty
  empty,

  ///Behaviour.disabled
  disabled,

  ///Behaviour.succes
  success,
}

String getBehaviourName(Behaviour behaviour) {
  var behaviours = {
    Behaviour.regular: 'Regular',
    Behaviour.loading: 'Loading',
    Behaviour.error: 'Error',
    Behaviour.disabled: 'Disabled',
    Behaviour.empty: 'Empty',
    Behaviour.success: 'success'
  };

  return behaviours[behaviour] ?? 'Regular';
}
