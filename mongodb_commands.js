// Hands-On 5 - MongoDB

use college_nosql

db.createCollection("feedback")

// Insert Documents

db.feedback.insertMany([
  {
    student_id: 1,
    course_code: "CS101",
    semester: "2022-ODD",
    rating: 5,
    comments: "Excellent teaching. Would recommend.",
    tags: [
      "challenging",
      "well-structured",
      "good-examples"
    ],
    submitted_at: ISODate("2022-11-30T10:15:00Z"),
    attachments: [
      {
        filename: "notes.pdf",
        size_kb: 240
      }
    ]
  },

  {
    student_id: 2,
    course_code: "CS101",
    semester: "2022-ODD",
    rating: 4,
    comments: "Good teaching.",
    tags: [
      "challenging",
      "practical"
    ],
    submitted_at: ISODate("2022-11-28T09:00:00Z"),
    attachments: [
      {
        filename: "assignment.pdf",
        size_kb: 180
      }
    ]
  },

  {
    student_id: 3,
    course_code: "CS101",
    semester: "2022-ODD",
    rating: 3,
    comments: "Average course.",
    tags: [
      "well-structured"
    ],
    submitted_at: ISODate("2022-11-20T10:00:00Z"),
    attachments: [
      {
        filename: "feedback.docx",
        size_kb: 60
      }
    ]
  },

  {
    student_id: 4,
    course_code: "CS102",
    semester: "2022-EVEN",
    rating: 5,
    comments: "Excellent!",
    tags: [
      "good-examples",
      "interesting"
    ],
    submitted_at: ISODate("2022-05-10T10:30:00Z"),
    attachments: [
      {
        filename: "notes.pdf",
        size_kb: 220
      }
    ]
  },

  {
    student_id: 5,
    course_code: "CS102",
    semester: "2022-EVEN",
    rating: 2,
    comments: "Needs improvement.",
    tags: [
      "difficult"
    ],
    submitted_at: ISODate("2022-05-15T11:00:00Z"),
    attachments: [
      {
        filename: "report.pdf",
        size_kb: 150
      }
    ]
  },

  {
    student_id: 6,
    course_code: "CS103",
    semester: "2022-ODD",
    rating: 5,
    comments: "Very useful course.",
    tags: [
      "excellent",
      "challenging"
    ],
    submitted_at: ISODate("2022-12-01T09:00:00Z")
  },

  {
    student_id: 7,
    course_code: "CS104",
    semester: "2021-EVEN",
    rating: 1,
    comments: "Poor experience.",
    tags: [
      "boring"
    ],
    submitted_at: ISODate("2021-11-20T10:00:00Z"),
    attachments: [
      {
        filename: "review.txt",
        size_kb: 25
      }
    ]
  },

  {
    student_id: 8,
    course_code: "CS105",
    semester: "2022-ODD",
    rating: 4,
    comments: "Good practical sessions.",
    tags: [
      "practical",
      "good-examples"
    ],
    submitted_at: ISODate("2022-11-18T09:45:00Z"),
    attachments: [
      {
        filename: "lab.pdf",
        size_kb: 180
      }
    ]
  },

  {
    student_id: 9,
    course_code: "CS101",
    semester: "2022-EVEN",
    rating: 5,
    comments: "Loved the course.",
    tags: [
      "challenging",
      "excellent"
    ],
    submitted_at: ISODate("2022-05-25T10:00:00Z"),
    attachments: [
      {
        filename: "summary.pdf",
        size_kb: 90
      }
    ]
  },

  {
    student_id: 10,
    course_code: "CS106",
    semester: "2022-ODD",
    rating: 3,
    comments: "Average learning experience.",
    tags: [
      "average"
    ],
    submitted_at: ISODate("2022-11-29T03:00:00Z"),
    attachments: [
      {
        filename: "feedback.pdf",
        size_kb: 120
      }
    ]
  }
])

// CRUD Operations
db.feedback.find({ rating: 5 })

db.feedback.find({
  course_code: "CS101",
  tags: "challenging"
})

db.feedback.find(
  {},
  {
    student_id: 1,
    course_code: 1,
    rating: 1,
    _id: 0
  }
)

db.feedback.updateMany(
  { rating: { $lt: 3 } },
  { $set: { needs_review: true } }
)

db.feedback.updateMany(
  { needs_review: true },
  { $push: { tags: "reviewed" } }
)

db.feedback.deleteMany({
  semester: "2021-EVEN"
})

// Aggregation
db.feedback.aggregate([
  { $match: { semester: "2022-ODD" } },
  {
    $group: {
      _id: "$course_code",
      avg_rating: { $avg: "$rating" },
      total_feedback: { $sum: 1 }
    }
  },
  { $sort: { avg_rating: -1 } }
])

db.feedback.aggregate([
  { $unwind: "$tags" },
  {
    $group: {
      _id: "$tags",
      count: { $sum: 1 }
    }
  },
  { $sort: { count: -1 } }
])

// Index
db.feedback.createIndex({ course_code: 1 })

db.feedback.find({ course_code: "CS101" }).explain("executionStats")