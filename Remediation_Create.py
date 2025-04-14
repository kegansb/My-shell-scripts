from docx import Document
from docx.shared import Pt, Inches
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.oxml.ns import qn

def create_remediation_doc(output_filename, incident_data):
    # Create a new Document
    doc = Document()

    # Set document styles
    style = doc.styles['Normal']
    style.font.name = 'Arial'
    style.font.size = Pt(11)

    # Title
    title = doc.add_heading('Cyber Intrusion Remediation Document', level=1)
    title.alignment = WD_ALIGN_PARAGRAPH.CENTER

    # Metadata
    doc.add_paragraph(f"Document ID: {incident_data['doc_id']}")
    doc.add_paragraph(f"Date Created: {incident_data['date_created']}")
    doc.add_paragraph(f"Prepared By: {incident_data['prepared_by']}")
    doc.add_paragraph(f"Incident Date: {incident_data['incident_date']}")
    doc.add_paragraph(f"Last Updated: {incident_data['last_updated']}")
    doc.add_paragraph()

    # Section 1: Incident Overview
    doc.add_heading('1. Incident Overview', level=2)
    doc.add_paragraph('Purpose: Summarize the intrusion for context.', style='Normal').bold = True
    doc.add_paragraph('Details:', style='Normal').bold = True
    for key, value in incident_data['overview'].items():
        doc.add_paragraph(f"{key}: {value}", style='List Bullet')

    # Section 2: Intrusion Specifics
    doc.add_heading('2. Intrusion Specifics', level=2)
    doc.add_paragraph('Purpose: Provide detailed information about the intrusion to inform remediation.', style='Normal').bold = True
    doc.add_paragraph('Details:', style='Normal').bold = True
    for key, value in incident_data['specifics'].items():
        doc.add_paragraph(f"{key}: {value}", style='List Bullet')

    # Section 3: Remediation Plan
    doc.add_heading('3. Remediation Plan', level=2)
    doc.add_paragraph('Purpose: Outline specific actions to contain, eradicate, and recover from the intrusion based on its specifics.', style='Normal').bold = True

    # Subsections
    subsections = [
        ('3.1 Containment Actions', incident_data['remediation']['containment']),
        ('3.2 Eradication Actions', incident_data['remediation']['eradication']),
        ('3.3 Recovery Actions', incident_data['remediation']['recovery']),
        ('3.4 Preventive Measures', incident_data['remediation']['preventive'])
    ]
    for subsection_title, items in subsections:
        doc.add_heading(subsection_title, level=3)
        for item in items:
            p = doc.add_paragraph(f"[ ] {item}", style='List Bullet')
    
    doc.add_paragraph('Notes:', style='Normal').bold = True
    doc.add_paragraph(incident_data['remediation']['notes'])

    # Section 4: Post-Incident Actions
    doc.add_heading('4. Post-Incident Actions', level=2)
    doc.add_paragraph('Purpose: Ensure lessons learned and compliance.', style='Normal').bold = True
    doc.add_paragraph('Details:', style='Normal').bold = True
    for key, value in incident_data['post_incident'].items():
        doc.add_paragraph(f"{key}: {value}", style='List Bullet')

    # Section 5: Stakeholders
    doc.add_heading('5. Stakeholders', level=2)
    doc.add_paragraph('Purpose: Identify key contacts for accountability.', style='Normal').bold = True
    table = doc.add_table(rows=1, cols=2)
    table.style = 'Table Grid'
    hdr_cells = table.rows[0].cells
    hdr_cells[0].text = 'Role'
    hdr_cells[1].text = 'Details'
    for role, details in incident_data['stakeholders']:
        row_cells = table.add_row().cells
        row_cells[0].text = role
        row_cells[1].text = details

    # Section 6: Appendices
    doc.add_heading('6. Appendices', level=2)
    for key, value in incident_data['appendices'].items():
        doc.add_paragraph(f"{key}: {value}", style='List Bullet')

    # Save the document
    doc.save(output_filename)
    print(f"Document saved as {output_filename}")

# Example incident data (customize this for each incident)
incident_data = {
    'doc_id': '[INC-YYYY-MM-DD-001]',
    'date_created': '[Insert Date]',
    'prepared_by': '[Your Name/Team Name]',
    'incident_date': '[Date of Intrusion]',
    'last_updated': '[Date of Last Update]',
    'overview': {
        'Incident Type': '[e.g., Malware, Phishing]',
        'Date/Time Detected': '[Insert Date/Time]',
        'Affected Systems/Assets': '[e.g., Servers, Endpoints]',
        'Impact Summary': '[e.g., Data Breach, Service Disruption]',
        'Initial Detection Method': '[e.g., IDS Alert, User Report]'
    },
    'specifics': {
        'Attack Vector': '[e.g., Exploited Vulnerability, Stolen Credentials]',
        'Indicators of Compromise (IoCs)': '[e.g., Malicious IPs, Hashes]',
        'Scope of Compromise': '[e.g., Number of Affected Devices]',
        'Root Cause (if known)': '[e.g., Unpatched Software]',
        'Threat Actor (if identified)': '[e.g., Known Group, Unknown]',
        'Evidence Collected': '[e.g., Logs, Memory Dumps]'
    },
    'remediation': {
        'containment': [
            'Short-Term Containment: [e.g., Isolate affected systems]',
            'Long-Term Containment: [e.g., Deploy network segmentation]'
        ],
        'eradication': [
            'Remove Malicious Artifacts: [e.g., Delete malware]',
            'Patch Vulnerabilities: [e.g., Apply software updates]',
            'Credential Reset: [e.g., Reset compromised accounts]'
        ],
        'recovery': [
            'Restore Systems/Services: [e.g., Rebuild servers]',
            'Validate Integrity: [e.g., Verify no residual threats]',
            'User Communication: [e.g., Notify affected users]'
        ],
        'preventive': [
            'Based on Intrusion Specifics: [e.g., If phishing, enhance email filters]',
            'General Hardening: [e.g., Update firewall rules]',
            'Monitoring Enhancements: [e.g., Add new IoCs to SIEM]'
        ],
        'notes': ('Tailor this section to the intrusion’s root cause and attack vector. '
                  'For example, a ransomware incident may prioritize backup restoration, '
                  'while a credential theft incident may focus on MFA enforcement.')
    },
    'post_incident': {
        'Incident Review Date': '[Schedule Date]',
        'Lessons Learned': '[e.g., Identified gaps in monitoring]',
        'Policy Updates': '[e.g., Revise incident response plan]',
        'Reporting Requirements': '[e.g., Notify regulators]',
        'Documentation Status': '[e.g., Final report archived]'
    },
    'stakeholders': [
        ('Incident Lead', '[Name, Role, Contact]'),
        ('IT/Security Team', '[Name(s), Role(s)]'),
        ('External Partners', '[e.g., Forensics Firm, Law Enforcement]'),
        ('Approver', '[Name, Role]')
    ],
    'appendices': {
        'Logs/Reports': '[Reference attached evidence or logs]',
        'Timeline of Events': '[Detailed chronology of incident and response]',
        'Additional Notes': '[Any other relevant information]'
    }
}

# Run the script
create_remediation_doc('remediation_template.docx', incident_data)
