import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:file_picker/file_picker.dart';
import '../widgets/app_bar.dart';
import '../widgets/footer.dart';
import '../utils/app_colors.dart';

class CareersScreen extends StatefulWidget {
  const CareersScreen({Key? key}) : super(key: key);

  @override
  State<CareersScreen> createState() => _CareersScreenState();
}

class _CareersScreenState extends State<CareersScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? _selectedFileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            _buildJobOpenings(context),
            _buildApplicationForm(context),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.accent,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Join Our Team',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 32 : 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Build Your Career with Us',
              style: TextStyle(
                color: Colors.white70,
                fontSize: isMobile ? 16 : 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobOpenings(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            'Current Openings',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 2,
            childAspectRatio: isMobile ? 1.5 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildJobCard(
                'Security Guards',
                'Multiple Positions Available',
                ['12th Pass', '18-45 years', 'Physical fitness required', 'Shift work'],
                'Full-time',
              ),
              _buildJobCard(
                'Construction Workers',
                'Skilled & Unskilled',
                ['Experience preferred', 'Physical stamina', 'Safety conscious', 'Team player'],
                'Contract',
              ),
              _buildJobCard(
                'Facility Management Staff',
                'Housekeeping & Maintenance',
                ['Basic education', 'Experience in cleaning', 'Attention to detail', 'Reliable'],
                'Full-time',
              ),
              _buildJobCard(
                'Supervisors',
                'Team Leadership Roles',
                ['Graduate preferred', '2+ years experience', 'Leadership skills', 'Communication skills'],
                'Full-time',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(String title, String subtitle, List<String> requirements, String type) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Chip(
                  label: Text(
                    type,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Requirements:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            ...requirements.map((req) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      req,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationForm(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      color: AppColors.background,
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        children: [
          Text(
            'Apply Now',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 40),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'firstName',
                            decoration: const InputDecoration(
                              labelText: 'First Name *',
                              border: OutlineInputBorder(),
                            ),
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FormBuilderTextField(
                            name: 'lastName',
                            decoration: const InputDecoration(
                              labelText: 'Last Name *',
                              border: OutlineInputBorder(),
                            ),
                            validator: FormBuilderValidators.required(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: const InputDecoration(
                        labelText: 'Email Address *',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'phone',
                      decoration: const InputDecoration(
                        labelText: 'Phone Number *',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderDropdown(
                      name: 'position',
                      decoration: const InputDecoration(
                        labelText: 'Position Applied For *',
                        border: OutlineInputBorder(),
                      ),
                      validator: FormBuilderValidators.required(),
                      items: [
                        'Security Guard',
                        'Construction Worker',
                        'Facility Management Staff',
                        'Supervisor',
                        'Other'
                      ].map((position) => DropdownMenuItem(
                        value: position,
                        child: Text(position),
                      )).toList(),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'experience',
                      decoration: const InputDecoration(
                        labelText: 'Years of Experience',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upload Resume *',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: _pickFile,
                                icon: const Icon(Icons.upload_file),
                                label: const Text('Choose File'),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  _selectedFileName ?? 'No file selected',
                                  style: TextStyle(
                                    color: _selectedFileName != null 
                                        ? AppColors.success 
                                        : Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'additionalInfo',
                      decoration: const InputDecoration(
                        labelText: 'Additional Information',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                      maxLines: 4,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitApplication,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Submit Application',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
      });
    }
  }

  void _submitApplication() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      if (_selectedFileName == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please upload your resume'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Application submitted successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Reset form
      _formKey.currentState?.reset();
      setState(() {
        _selectedFileName = null;
      });
    }
  }
}