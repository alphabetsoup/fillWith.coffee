expect = chai.expect
formMarkup = '<div id="fixture"><form id="testForm"> <select id="testSelect">' + '<option> Hello </option> </select>' + '<input type="hidden" name="contest.question1" value="some bad question"/>' + '<input type="text" id="contestInput" name="contest.answer1"/>' + '<input type="hidden" name="contest.question2" value="some bad question"/>' + '<select name="contest.answer2"> <option>Good</option>' + '<option id="contestOption">Great</option> </select>' + '<input type="hidden" name="contest.question3" value="some bad question"/>' + '<input type="text" id="badQuizAnswer" name="contest.answer3"/></form></div>'
describe 'Utilities', ->
  'use strict'
  ourQuiz = undefined
  contestData = 
    question1: 'How Are you?'
    answer1: 'Fine, thanks.'
    question2: 'Status'
    answer2: 'Great'
    question3: 'Who is the greatest painter?'
    answer3: 'Raphael'
  before ->
    ourQuiz = new Quiz(contestData)
    jQuery('body').append formMarkup
    return
  after ->
    jQuery('#fixture').remove()
    return
  it 'should correctly list data', ->
    expect(ourQuiz.isSelect('select')).to.be.true
    expect(ourQuiz.isSelect('input')).to.be.false
    expect(ourQuiz.isInput('input')).to.be.true
    expect(ourQuiz.isSelect('input')).to.be.false
    return
  it 'should select the correct option', ->
    select = document.getElementById('testSelect')
    ourQuiz.prefillSelect select, 'Hello'
    expect(select.children[0].selected).to.be.true
    return
  it 'should identify matching questions', ->
    expect(ourQuiz.questionMatches(1, contestData.question1)).to.be.true
    return
  it 'should identify non-matching questions', ->
    expect(ourQuiz.questionMatches(1, contestData.question1 + 'blah')).to.be.false
    return
  return
describe 'Main function', ->
  'use strict'
  ourQuiz = undefined
  form = undefined
  contestData = 
    question1: 'How Are you?'
    answer1: 'Fine, thanks.'
    question2: 'Status'
    answer2: 'Great'
    question3: 'Who is the greatest painter?'
    answer3: 'Raphael'
  before ->
    ourQuiz = new Quiz(contestData)
    form = jQuery('body').append(formMarkup)
    return
  after ->
    jQuery('#fixture').remove()
    return
  beforeEach ->
    document.getElementById('contestOption').value = contestData.answer2
    jQuery('input[name="contest.question1"]').val contestData.question1
    jQuery('input[name="contest.question2"]').val contestData.question2
    ourQuiz.prefillQuizForm form
    return
  it 'should fill the text fields that correspond to an answer', ->
    expect(document.getElementById('contestInput').value).to.equal contestData.answer1
    return
  it 'should select the options that correspond to an answer', ->
    expect(document.getElementById('contestOption').selected).to.be.true
    return
  it 'should skip fields where the question has changed', ->
    expect(document.getElementById('badQuizAnswer').value).to.be.empty
    return
  return
describe 'Initialization', ->
  'use strict'
  it 'should initialize the main object', ->
    contestData = 
      question1: 'How Are you?'
      answer1: 'Fine, thanks.'
      question2: 'Status'
      answer2: 'Great'
      question3: 'Who is the greatest painter?'
      answer3: 'Raphael'
    contest = new Quiz(contestData)
    return
  return

