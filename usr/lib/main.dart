import "package:flutter/material.dart";

void main() {
  runApp(const SeoCopilotApp());
}

class SeoCopilotApp extends StatelessWidget {
  const SeoCopilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SEO Copilot",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
        cardColor: Colors.grey[850],
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 14.0, height: 1.5),
          bodySmall: TextStyle(fontSize: 12.0, color: Colors.grey),
        ),
      ),
      home: const SeoCopilotDashboard(),
    );
  }
}

class SeoCopilotDashboard extends StatelessWidget {
  const SeoCopilotDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("SEO Copilot Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("⚙️ How SEO Copilot Works", textTheme),
            const SizedBox(height: 8),
            Text(
              "SEO Copilot acts as an autonomous SEO growth engineer — it doesn’t just analyze data but also learns, predicts, and optimizes website and app rankings automatically.",
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            _buildWorkflowSteps(),
            const SizedBox(height: 24),
            _buildSectionTitle("🧠 Tech Stack Overview", textTheme),
            const SizedBox(height: 16),
            _buildTechStackTable(),
            const SizedBox(height: 24),
            _buildSectionTitle("🔄 In Short", textTheme),
            const SizedBox(height: 16),
            _buildSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, TextTheme textTheme) {
    return Text(
      title,
      style: textTheme.titleLarge,
    );
  }

  Widget _buildWorkflowSteps() {
    return const Column(
      children: [
        WorkflowStepTile(
          title: "1. Data Aggregation Layer",
          icon: Icons.layers,
          content:
              "Collects SEO data from Google Search Console, Play Store, and website crawlers using APIs, web scrapers, and Selenium automation to create a unified dataset.",
        ),
        WorkflowStepTile(
          title: "2. Knowledge Graph Construction",
          icon: Icons.device_hub,
          content:
              "Structures data into a graph (Neo4j/NetworkX) where nodes are keywords, pages, etc., and edges are relationships. This helps the AI understand contextual relationships.",
        ),
        WorkflowStepTile(
          title: "3. Predictive AI Engine (TGNN + LLM)",
          icon: Icons.online_prediction,
          content:
              "A Temporal Graph Neural Network (TGNN) analyzes the graph over time to predict ranking drift. An LLM (like GPT) converts these predictions into human-readable insights.",
        ),
        WorkflowStepTile(
          title: "4. Optimization Agent (Reinforcement Learning)",
          icon: Icons.auto_awesome,
          content:
              "An RL agent (PPO/DQN) decides the best optimization actions (e.g., updating meta titles, changing links) and learns from feedback to automate improvements.",
        ),
        WorkflowStepTile(
          title: "5. Dashboard Interface",
          icon: Icons.dashboard,
          content:
              "A Streamlit or Next.js dashboard displays all metrics, predictions, and optimizations. It provides interactive and visual reports on performance.",
        ),
      ],
    );
  }

  Widget _buildTechStackTable() {
    const techStack = [
      {"tech": "Python", "purpose": "Core language for data processing, AI models, and backend logic"},
      {"tech": "BeautifulSoup & Selenium", "purpose": "Web scraping and crawling to collect SEO data"},
      {"tech": "PyTorch Geometric", "purpose": "Framework for building and training Temporal Graph Neural Networks (TGNNs)"},
      {"tech": "GPT API (LLM)", "purpose": "Generates human-readable SEO insights and suggestions"},
      {"tech": "NetworkX / Neo4j", "purpose": "Constructs and manages the Knowledge Graph"},
      {"tech": "MongoDB", "purpose": "Stores collected SEO metrics, ranking history, and AI model outputs"},
      {"tech": "Streamlit / Next.js", "purpose": "Frontend dashboard to visualize performance"},
      {"tech": "Reinforcement Learning (PPO/DQN)", "purpose": "Algorithm that decides which optimization actions to take"},
    ];

    return Card(
      elevation: 2,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 20,
          columns: const [
            DataColumn(label: Text("Technology", style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text("Purpose / Role in Project", style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: techStack.map((item) => DataRow(
            cells: [
              DataCell(Text(item["tech"]!)),
              DataCell(SizedBox(width: 300, child: Text(item["purpose"]!, softWrap: true))),
            ],
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildSummary() {
    const summaryPoints = [
      "Collects SEO data",
      "Builds a Knowledge Graph",
      "Predicts ranking changes using TGNN",
      "Decides optimization steps using RL",
      "Explains & Displays results on an interactive dashboard",
    ];

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryPoints.asMap().entries.map((entry) {
            int idx = entry.key;
            String val = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${idx + 1}. ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(val)),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class WorkflowStepTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String content;

  const WorkflowStepTile({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.cyanAccent),
        title: Text(title, style: textTheme.titleMedium),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content, style: textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
