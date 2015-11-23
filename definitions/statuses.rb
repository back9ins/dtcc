module StatusList
  def StatusList.get(status)
    statuses = {
      'pending' => [
        'Submitted', 'Approved', 'Issued',
        'Received Delivery Requirements', 'Awaiting Delivery Requirements from Agent',
        'All Offers In', 'Awaiting Carrier Offers',
        'Gathering Medical Information', 'Informal Entered', 'Entered', 'Active - Pending Requirements'
      ],
      'active' => [
        'Active', 'Annuitized', 'Letter of Authorization Sent', 'One Deceased',
        'Active Annuity Payout', 'Paid Up', 'Lapse Pending', 'Active - Pending Requirements'
      ],
      'inactive' => [
        'Not Taken', 'Withdrawn', 'Postponed', 'Declined', 'Informal Closed',
        'Informal Formalized', 'Surrendered', 'Matured', 'Deceased/Death Claim',
        'Pended', 'Cancelled', 'Free Look', 'Deferred Death', 'Lapsed', 'Surrender to the client',
        'Surrender/Exchanged to a third party', 'Surrender/Converted', 'Termination', 'Rescinded',
        'Informal Formalized', 'Informal Closed'
      ],
      'informal' => [
        'All Offers In', 'Informal Formalized', 'Informal Closed', 'Awaiting Carrier Offers',
        'Gathering Medical Information', 'Informal Entered'
      ],
      'show' => [
        'Entered', 'Submitted', 'Approved', 'Issued', 'Awaiting Delivery Requirements from Agent', 'Received Delivery Requirements',
        'Active', 'Withdrawn', 'Postponed', 'Not Taken', 'Declined', 'Active - Pending Requirements', 'Lapsed'
      ],
      'all' => [
        'Not Taken', 'Withdrawn', 'Postponed', 'Declined', 'Surrendered', 'Matured', 'Deceased/Death Claim',
        'Pended', 'Cancelled', 'Free Look', 'Deferred Death', 'Lapsed', 'Surrender to the client',
        'Surrender/Exchanged to a third party', 'Surrender/Converted', 'Termination', 'Rescinded',
        'Active', 'Annuitized', 'Letter of Authorization Sent', 'One Deceased',
        'Active Annuity Payout', 'Paid Up', 'Lapse Pending', 'Submitted', 'Approved', 'Issued',
        'Received Delivery Requirements', 'Awaiting Delivery Requirements from Agent', 'Entered'
      ]
    }

    statuses[status]
  end

  def StatusList.abbr(status)
    statuses = {
      'VA' => 'Active',
      'SU' => 'Surrendered',
      'MA' => 'Matured',
      'DE' => 'Deceased/Death Claim',
      'AN' => 'Annuitized',
      'PB' => 'LOA Sent (Letter of Authorization)',
      'PD' => 'Pended',
      'CC' => 'Cancelled',
      'FL' => 'Free Look',
      'NT' => 'Not Taken',
      'DA' => 'Deferred Death',
      'GS' => 'Suspended',
      'LP' => 'Lapsed',
      'SI' => 'Surrender/Individual (to the client)',
      'SE' => 'Surrender/Exchange (to a third party)',
      'SC' => 'Surrender/Converted'
    }

    statuses[status]
  end

  def StatusList.cases(status)
    statuses = {
      'pending' => [
        'Awaiting Carrier Offers', 'Submitted', 'Approved', 'Issued',
        'Gathering Medical Information', 'All Offers In', 'Informal Entered',
        'Received Delivery Requirements', 'Awaiting Delivery Requirements from Agent',
        'Entered'
      ],
      'active' => [
        'Active', 'Annuitized', 'Letter of Authorization Sent', 'One Deceased',
        'Active Annuity Payout', 'Paid Up', 'Lapse Pending'
      ],
      'inactive' => [
        'Not Taken', 'Withdrawn', 'Postponed', 'Declined', 'Informal Closed',
        'Informal Formalized', 'Surrendered', 'Matured', 'Deceased/Death Claim',
        'Pended', 'Cancelled', 'Free Look', 'Deferred Death', 'Lapsed', 'Surrender to the client',
        'Surrender/Exchanged to a third party', 'Surrender/Converted', 'Termination', 'Rescinded'
      ]
    }

    statuses[status]
  end

  def StatusList.cases_reverse(status)
    statuses = {
      'pending' => [
        'Awaiting Carrier Offers', 'Submitted', 'Approved', 'Issued',
        'Gathering Medical Information', 'All Offers In', 'Informal Entered',
        'Received Delivery Requirements', 'Awaiting Delivery Requirements from Agent',
        'Entered', 'Active - Pending Requirements', 'Entered'
      ],
      'active' => [
        'Active', 'Annuitized', 'Letter of Authorization Sent', 'One Deceased',
        'Active Annuity Payout', 'Paid Up', 'Lapse Pending'
      ],
      'inactive' => [
        'Not Taken', 'Withdrawn', 'Postponed', 'Declined', 'Informal Closed',
        'Informal Formalized', 'Surrendered', 'Matured', 'Deceased/Death Claim',
        'Pended', 'Cancelled', 'Free Look', 'Deferred Death', 'Lapsed', 'Surrender to the client',
        'Surrender/Exchanged to a third party', 'Surrender/Converted', 'Termination', 'Rescinded'
      ]
    }

    general_status_return = ''

    statuses.keys.each do |general_status|
      if statuses[general_status].include?(status)
        general_status_return = general_status.humanize
      end
    end

    general_status_return
  end

  def StatusList.appointments(status)
    statuses = {
      'pending' => [
        'pending', 'entered'
      ],
      'active' => [
        'active'
      ],
      'inactive' => [
        'closed', 'terminated'
      ]
    }

    statuses[status]
  end
end
