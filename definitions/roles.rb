module RoleList
  def RoleList.abbr(role = nil)
    roles = {
      'BE' => 'Primary Beneficiary',
      'BT' => 'Beneficiary Trustee',
      'G2' => 'Annuitant',
      'G5' => 'Contingent Beneficiary',
      'HA' => 'Owner',
      'HC' => 'Joint Annuitant',
      'HD' => 'Contingent Annuitant/Insured',
      'HE' => 'Contingent Owner',
      'JV' => 'Joint Owner',
      'OK' => 'Owner/Annuitant or Insured',
      'CA' => 'Collateral Assignee',
      'AA' => 'Absolute Assignee',
      '69' => 'Trustee',
      'PE' => 'Payee',
      'PA' => 'Power of Attorney',
      'CU' => 'Custodian for UTMA',
      'PT' => 'Participant',
      'SP' => 'Successor Participant',
      'DP' => 'Designated Participant',
      'IP' => 'Indirect Participant',
      'CP' => 'Co-Participant',
      'LP' => 'Legal Guardian',
      'CI' => 'Contingent Indirect Participant',
      'PI' => 'Insured',
      'JI' => 'Joint Insured',
      'CE' => 'Correspondence Entity',
      'EX' => 'Executor',
      'PS' => 'Plan Sponsor',
      'CT' => 'Coverage Insured',
      'IA' => 'Investment Advisor',
      'DE' => 'Decedent',
    }

    if role
      roles[role]
    else
      roles
    end
  end

  def RoleList.unabbr(role)
    roles = {
      'Primary Beneficiary' => 'BE',
      'Beneficiary Trustee' => 'BT',
      'Annuitant' => 'G2',
      'Contingent Beneficiary' => 'G5',
      'Owner' => 'HA',
      'Joint Annuitant' => 'HC',
      'Contingent Annuitant/Insured' => 'HD',
      'Contingent Owner' => 'HE',
      'Joint Owner' => 'JV',
      'Owner/Annuitant or Insured' => 'OK',
      'Collateral Assignee' => 'CA',
      'Absolute Assignee' => 'AA',
      'Trustee' => '69',
      'Payee' => 'PE',
      'Power of Attorney' => 'PA',
      'Custodian for UTMA' => 'CU',
      'Participant' => 'PT',
      'Successor Participant' => 'SP',
      'Designated Participant' => 'DP',
      'Indirect Participant' => 'IP',
      'Co-Participant' => 'CP',
      'Legal Guardian' => 'LP',
      'Contingent Indirect Participant' => 'CI',
      'Insured' => 'PI',
      'Joint Insured' => 'JI',
      'Correspondence Entity' => 'CE',
      'Executor' => 'EX',
      'Plan Sponsor' => 'PS',
      'Coverage Insured' => 'CT',
      'Investment Advisor' => 'IA',
      'Decedent' => 'DE',
    }

    roles[role]
  end
end
