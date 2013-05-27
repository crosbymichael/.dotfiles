include supervisor

supervisor::service { 'test':
  command => '/bin/true',
}
