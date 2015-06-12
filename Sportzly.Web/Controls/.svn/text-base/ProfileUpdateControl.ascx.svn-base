<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileUpdateControl.ascx.cs" Inherits="Sportzly.Web.Controls.ProfileUpdateControl" %>
<%@ Register Src="~/Controls/LightBoxControl.ascx" TagPrefix="uc1" TagName="LightBoxControl" %>
<script src="/uploadify/jquery.uploadifive.js"></script>
<link href="/uploadify/uploadifive.css" rel="stylesheet" />
<script src="Common/Styles/ApiScripts/ProfileUpdateControlNew.js"></script>
<uc1:LightBoxControl runat="server" ID="LightBoxControl" />
<style type="text/css">
    #uploadProfileImageBox-button {
        width: 149px !important;
        height: 36px !important;
        margin-top: 5px !important;
    }

    #uploadProfileImageBox {
        margin-left: 5px !important;
    }

    .uploadlogo {
        background-image: url('../images/profile_photo.png');
        border: none;
        border-radius: 0px;
        background-color: white;
        margin-left: 10px;
    }

    .uploadifive-queue-item {
        width: 200px;
        margin-left: 10px;
    }

    #uploadifive-uploadProfileImageBoxFive input {
        top: 5px !important;
    }
    /*.chosen-container {
        float: left !important;
    }*/
</style>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"></script>
<script src="Scripts/jquery.geocomplete.js"></script>

<section id="wrapper" class="form profile">
    <nav class="head_profile">
        <h1>Profile</h1>
    </nav>
    <h3 class="title">Basic Info</h3>

    <div class="form">
        <ul class="ulform">
            <li style="width: 700px;">
                <p class="derc">*Required</p>
            </li>
            <li>
                <label for="fisrtname">
                    First Name
                    <span class="rq">* </span>
                </label>
                <input id="txtFirstName" type="text" data-bind="value: Results()[0].FirstName" runat="server" class="required" />
            </li>
            <li>
                <label for="lastname">
                    Last Name
                    <span class="rq">* </span>
                </label>
                <input runat="server" id="txtLastName" type="text" data-bind="value: Results()[0].LastName" class="required" />
            </li>
            <li>
                <label for="gender">Gender <span class="rq">* </span></label>

                <select id="ddlGenders" name="ddlGenders" data-placeholder="Select Gender" class="chosen-select-nosearch gender" data-bind="value: Results()[0].GenderId" runat="server" style="width: 241px;">
                    <option value=""></option>
                    <option value="1">Male</option>
                    <option value="2">Female</option>
                </select>
            </li>
            <li>
                <label for="dob">DOB <span class="rq">* </span></label>
                <input id="txtDOB" maxlength="10" value="" style="width: 100px;" class="customInput DOB" data-bind="date: Results()[0].DOB" runat="server" />&nbsp;&nbsp;<label style="text-align: left; width: 100px;"> &nbsp;&nbsp;(MM-DD-YYYY)</label>
            </li>
            <%--  <li>
                <label for="dob1">DOB <span class="rq">* </span></label>
                <select id="ddlMonth" data-placeholder="Month" class="chosen-select month" style="width:50px;" >
                    <option value="01">Jan</option>
                    <option value="02">Feb</option>
                    <option value="03">Mar</option>
                    <option value="04">Apr</option>
                    <option value="05">May</option>
                    <option value="06">Jun</option>
                    <option value="07">Jul</option>
                    <option value="08">Aug</option>
                    <option value="09">Sep</option>
                    <option value="10">Oct</option>
                    <option value="11">Nov</option>
                    <option value="12">Dec</option>
                </select>
                  <select id="ddlDay">
                    <option value="01">1</option>
                    <option value="02">2</option>
                    <option value="03">3</option>
                    <option value="04">4</option>
                    <option value="05">5</option>
                    <option value="06">6</option>
                    <option value="07">7</option>
                    <option value="08">8</option>
                    <option value="09">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </li>--%>
            <li>
                <label for="City">City <span class="rq">* </span></label>
                <input id="txtCity" type="text" data-bind="value: Results()[0].City" class="city" runat="server" />
            </li>
            <li>
                <label for="Country">Country <span class="rq">* </span></label>
                <select id="ddlCountries" name="ddlCountries" data-placeholder="Choose a Country" class="chosen-select country" style="width: 241px;" data-bind="value: Results()[0].Country" runat="server">
                    <option value=""></option>
                    <option value="United States">United States</option>
                    <option value="United Kingdom">United Kingdom</option>
                    <option value="Afghanistan">Afghanistan</option>
                    <option value="Aland Islands">Aland Islands</option>
                    <option value="Albania">Albania</option>
                    <option value="Algeria">Algeria</option>
                    <option value="American Samoa">American Samoa</option>
                    <option value="Andorra">Andorra</option>
                    <option value="Angola">Angola</option>
                    <option value="Anguilla">Anguilla</option>
                    <option value="Antarctica">Antarctica</option>
                    <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                    <option value="Argentina">Argentina</option>
                    <option value="Armenia">Armenia</option>
                    <option value="Aruba">Aruba</option>
                    <option value="Australia">Australia</option>
                    <option value="Austria">Austria</option>
                    <option value="Azerbaijan">Azerbaijan</option>
                    <option value="Bahamas">Bahamas</option>
                    <option value="Bahrain">Bahrain</option>
                    <option value="Bangladesh">Bangladesh</option>
                    <option value="Barbados">Barbados</option>
                    <option value="Belarus">Belarus</option>
                    <option value="Belgium">Belgium</option>
                    <option value="Belize">Belize</option>
                    <option value="Benin">Benin</option>
                    <option value="Bermuda">Bermuda</option>
                    <option value="Bhutan">Bhutan</option>
                    <option value="Bolivia, Plurinational State of">Bolivia, Plurinational State of</option>
                    <option value="Bonaire, Sint Eustatius and Saba">Bonaire, Sint Eustatius and Saba</option>
                    <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                    <option value="Botswana">Botswana</option>
                    <option value="Bouvet Island">Bouvet Island</option>
                    <option value="Brazil">Brazil</option>
                    <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                    <option value="Brunei Darussalam">Brunei Darussalam</option>
                    <option value="Bulgaria">Bulgaria</option>
                    <option value="Burkina Faso">Burkina Faso</option>
                    <option value="Burundi">Burundi</option>
                    <option value="Cambodia">Cambodia</option>
                    <option value="Cameroon">Cameroon</option>
                    <option value="Canada">Canada</option>
                    <option value="Cape Verde">Cape Verde</option>
                    <option value="Cayman Islands">Cayman Islands</option>
                    <option value="Central African Republic">Central African Republic</option>
                    <option value="Chad">Chad</option>
                    <option value="Chile">Chile</option>
                    <option value="China">China</option>
                    <option value="Christmas Island">Christmas Island</option>
                    <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
                    <option value="Colombia">Colombia</option>
                    <option value="Comoros">Comoros</option>
                    <option value="Congo">Congo</option>
                    <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
                    <option value="Cook Islands">Cook Islands</option>
                    <option value="Costa Rica">Costa Rica</option>
                    <option value="Cote D'ivoire">Cote D'ivoire</option>
                    <option value="Croatia">Croatia</option>
                    <option value="Cuba">Cuba</option>
                    <option value="Curacao">Curacao</option>
                    <option value="Cyprus">Cyprus</option>
                    <option value="Czech Republic">Czech Republic</option>
                    <option value="Denmark">Denmark</option>
                    <option value="Djibouti">Djibouti</option>
                    <option value="Dominica">Dominica</option>
                    <option value="Dominican Republic">Dominican Republic</option>
                    <option value="Ecuador">Ecuador</option>
                    <option value="Egypt">Egypt</option>
                    <option value="El Salvador">El Salvador</option>
                    <option value="Equatorial Guinea">Equatorial Guinea</option>
                    <option value="Eritrea">Eritrea</option>
                    <option value="Estonia">Estonia</option>
                    <option value="Ethiopia">Ethiopia</option>
                    <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
                    <option value="Faroe Islands">Faroe Islands</option>
                    <option value="Fiji">Fiji</option>
                    <option value="Finland">Finland</option>
                    <option value="France">France</option>
                    <option value="French Guiana">French Guiana</option>
                    <option value="French Polynesia">French Polynesia</option>
                    <option value="French Southern Territories">French Southern Territories</option>
                    <option value="Gabon">Gabon</option>
                    <option value="Gambia">Gambia</option>
                    <option value="Georgia">Georgia</option>
                    <option value="Germany">Germany</option>
                    <option value="Ghana">Ghana</option>
                    <option value="Gibraltar">Gibraltar</option>
                    <option value="Greece">Greece</option>
                    <option value="Greenland">Greenland</option>
                    <option value="Grenada">Grenada</option>
                    <option value="Guadeloupe">Guadeloupe</option>
                    <option value="Guam">Guam</option>
                    <option value="Guatemala">Guatemala</option>
                    <option value="Guernsey">Guernsey</option>
                    <option value="Guinea">Guinea</option>
                    <option value="Guinea-bissau">Guinea-bissau</option>
                    <option value="Guyana">Guyana</option>
                    <option value="Haiti">Haiti</option>
                    <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
                    <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
                    <option value="Honduras">Honduras</option>
                    <option value="Hong Kong">Hong Kong</option>
                    <option value="Hungary">Hungary</option>
                    <option value="Iceland">Iceland</option>
                    <option value="India">India</option>
                    <option value="Indonesia">Indonesia</option>
                    <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
                    <option value="Iraq">Iraq</option>
                    <option value="Ireland">Ireland</option>
                    <option value="Isle of Man">Isle of Man</option>
                    <option value="Israel">Israel</option>
                    <option value="Italy">Italy</option>
                    <option value="Jamaica">Jamaica</option>
                    <option value="Japan">Japan</option>
                    <option value="Jersey">Jersey</option>
                    <option value="Jordan">Jordan</option>
                    <option value="Kazakhstan">Kazakhstan</option>
                    <option value="Kenya">Kenya</option>
                    <option value="Kiribati">Kiribati</option>
                    <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
                    <option value="Korea, Republic of">Korea, Republic of</option>
                    <option value="Kuwait">Kuwait</option>
                    <option value="Kyrgyzstan">Kyrgyzstan</option>
                    <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
                    <option value="Latvia">Latvia</option>
                    <option value="Lebanon">Lebanon</option>
                    <option value="Lesotho">Lesotho</option>
                    <option value="Liberia">Liberia</option>
                    <option value="Libya">Libya</option>
                    <option value="Liechtenstein">Liechtenstein</option>
                    <option value="Lithuania">Lithuania</option>
                    <option value="Luxembourg">Luxembourg</option>
                    <option value="Macao">Macao</option>
                    <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
                    <option value="Madagascar">Madagascar</option>
                    <option value="Malawi">Malawi</option>
                    <option value="Malaysia">Malaysia</option>
                    <option value="Maldives">Maldives</option>
                    <option value="Mali">Mali</option>
                    <option value="Malta">Malta</option>
                    <option value="Marshall Islands">Marshall Islands</option>
                    <option value="Martinique">Martinique</option>
                    <option value="Mauritania">Mauritania</option>
                    <option value="Mauritius">Mauritius</option>
                    <option value="Mayotte">Mayotte</option>
                    <option value="Mexico">Mexico</option>
                    <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
                    <option value="Moldova, Republic of">Moldova, Republic of</option>
                    <option value="Monaco">Monaco</option>
                    <option value="Mongolia">Mongolia</option>
                    <option value="Montenegro">Montenegro</option>
                    <option value="Montserrat">Montserrat</option>
                    <option value="Morocco">Morocco</option>
                    <option value="Mozambique">Mozambique</option>
                    <option value="Myanmar">Myanmar</option>
                    <option value="Namibia">Namibia</option>
                    <option value="Nauru">Nauru</option>
                    <option value="Nepal">Nepal</option>
                    <option value="Netherlands">Netherlands</option>
                    <option value="New Caledonia">New Caledonia</option>
                    <option value="New Zealand">New Zealand</option>
                    <option value="Nicaragua">Nicaragua</option>
                    <option value="Niger">Niger</option>
                    <option value="Nigeria">Nigeria</option>
                    <option value="Niue">Niue</option>
                    <option value="Norfolk Island">Norfolk Island</option>
                    <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                    <option value="Norway">Norway</option>
                    <option value="Oman">Oman</option>
                    <option value="Pakistan">Pakistan</option>
                    <option value="Palau">Palau</option>
                    <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
                    <option value="Panama">Panama</option>
                    <option value="Papua New Guinea">Papua New Guinea</option>
                    <option value="Paraguay">Paraguay</option>
                    <option value="Peru">Peru</option>
                    <option value="Philippines">Philippines</option>
                    <option value="Pitcairn">Pitcairn</option>
                    <option value="Poland">Poland</option>
                    <option value="Portugal">Portugal</option>
                    <option value="Puerto Rico">Puerto Rico</option>
                    <option value="Qatar">Qatar</option>
                    <option value="Reunion">Reunion</option>
                    <option value="Romania">Romania</option>
                    <option value="Russian Federation">Russian Federation</option>
                    <option value="Rwanda">Rwanda</option>
                    <option value="Saint Barthelemy">Saint Barthelemy</option>
                    <option value="Saint Helena, Ascension and Tristan da Cunha">Saint Helena, Ascension and Tristan da Cunha</option>
                    <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                    <option value="Saint Lucia">Saint Lucia</option>
                    <option value="Saint Martin (French part)">Saint Martin (French part)</option>
                    <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                    <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
                    <option value="Samoa">Samoa</option>
                    <option value="San Marino">San Marino</option>
                    <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                    <option value="Saudi Arabia">Saudi Arabia</option>
                    <option value="Senegal">Senegal</option>
                    <option value="Serbia">Serbia</option>
                    <option value="Seychelles">Seychelles</option>
                    <option value="Sierra Leone">Sierra Leone</option>
                    <option value="Singapore">Singapore</option>
                    <option value="Sint Maarten (Dutch part)">Sint Maarten (Dutch part)</option>
                    <option value="Slovakia">Slovakia</option>
                    <option value="Slovenia">Slovenia</option>
                    <option value="Solomon Islands">Solomon Islands</option>
                    <option value="Somalia">Somalia</option>
                    <option value="South Africa">South Africa</option>
                    <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
                    <option value="South Sudan">South Sudan</option>
                    <option value="Spain">Spain</option>
                    <option value="Sri Lanka">Sri Lanka</option>
                    <option value="Sudan">Sudan</option>
                    <option value="Suriname">Suriname</option>
                    <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                    <option value="Swaziland">Swaziland</option>
                    <option value="Sweden">Sweden</option>
                    <option value="Switzerland">Switzerland</option>
                    <option value="Syrian Arab Republic">Syrian Arab Republic</option>
                    <option value="Taiwan, Province of China">Taiwan, Province of China</option>
                    <option value="Tajikistan">Tajikistan</option>
                    <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
                    <option value="Thailand">Thailand</option>
                    <option value="Timor-leste">Timor-leste</option>
                    <option value="Togo">Togo</option>
                    <option value="Tokelau">Tokelau</option>
                    <option value="Tonga">Tonga</option>
                    <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                    <option value="Tunisia">Tunisia</option>
                    <option value="Turkey">Turkey</option>
                    <option value="Turkmenistan">Turkmenistan</option>
                    <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                    <option value="Tuvalu">Tuvalu</option>
                    <option value="Uganda">Uganda</option>
                    <option value="Ukraine">Ukraine</option>
                    <option value="United Arab Emirates">United Arab Emirates</option>
                    <option value="United Kingdom">United Kingdom</option>
                    <option value="United States">United States</option>
                    <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
                    <option value="Uruguay">Uruguay</option>
                    <option value="Uzbekistan">Uzbekistan</option>
                    <option value="Vanuatu">Vanuatu</option>
                    <option value="Venezuela, Bolivarian Republic of">Venezuela, Bolivarian Republic of</option>
                    <option value="Viet Nam">Viet Nam</option>
                    <option value="Virgin Islands, British">Virgin Islands, British</option>
                    <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
                    <option value="Wallis and Futuna">Wallis and Futuna</option>
                    <option value="Western Sahara">Western Sahara</option>
                    <option value="Yemen">Yemen</option>
                    <option value="Zambia">Zambia</option>
                    <option value="Zimbabwe">Zimbabwe</option>
                </select>
            </li>
            <li style="display: none;">
                <label for="Zipcode">Zipcode <span class="rq">* </span></label>
                <input id="txtZip" type="text" data-bind="value: Results()[0].ZIP" runat="server" class="zip" />
            </li>
            <li>
                <label for="Mobile Phone">Mobile Phone</label>
                <input id="txtPhone" type="text" data-bind="value: Results()[0].Phone" runat="server" class="phone" placeholder="Ex:8885553333" />
            </li>
            <li id="limobile">
                <label for="Carrier">Carrier</label>
                <asp:DropDownList ID="ddlCarrier" runat="server" class="chosen-select-nosearch" Style="width: 241px;"></asp:DropDownList>
            </li>
            <li id="limsg">
                <label style="width: 730px; font-weight: bold; margin-top: 0px; font-size: 12px; color: #319C22;">(Please enter your mobile number if you want us to push bulletin board notifications, standard charges may apply)</label>
            </li>
            <li>
                <label for="One line about you">One line about you</label>
                <input id="txtSummary" maxlength="50" type="text" data-bind="value: Results()[0].Summary" runat="server" />
            </li>
        </ul>
    </div>

    <h3 class="title_sports">Sports Info</h3>
    <div class="form">
        <ul class="ulform">
            <li>
                <label for="Level">Level<span class="rq">* </span></label>
                <select id="ddlLevels" data-placeholder="Select Level" class="chosen-select-nosearch level" style="width: 241px;" data-bind="value: Results()[0].OtherLevel" runat="server">
                    <option value=""></option>
                    <option value="Amateur">Amateur</option>
                    <option value="Casual">Casual</option>
                    <option value="College">College</option>
                    <option value="Competitive">Competitive</option>
                    <option value="Freshman">Freshman</option>
                    <option value="High School">High School</option>
                    <option value="Junior Under 13">Junior Under 13</option>
                    <option value="Junior Varsity">Junior Varsity</option>
                    <option value="Little league">Little league</option>
                    <option value="Middle School">Middle School</option>
                    <option value="Professional">Professional</option>
                    <option value="Recreational">Recreational</option>
                    <option value="Varsity">Varsity</option>
                </select>
            </li>
            <li>
                <label for="Role">Role<span class="rq">* </span></label>
                <select id="ddlRoles" data-placeholder="Select Role" class="chosen-select-nosearch role" style="width: 241px;" data-bind="value: Results()[0].OtherSportsTag" runat="server">
                    <option value=""></option>
                    <option value="Athlete">Athlete</option>
                    <option value="Athletic Director">Athletic Director</option>
                    <option value="Cheerleader">Cheerleader</option>
                    <option value="Coach">Coach</option>
                    <option value="Fan">Fan</option>
                    <option value="Grandparent">Grandparent</option>
                    <option value="League Admin">League Admin</option>
                    <option value="Marketing">Marketing</option>
                    <option value="Organization Admin">Organization Admin</option>
                    <option value="Owner">Owner</option>
                    <option value="Parent">Parent</option>
                    <option value="Personal Trainer">Personal Trainer</option>
                    <option value="Physio">Physio</option>
                    <option value="Press">Press</option>
                    <option value="Program Coordinator">Program Coordinator</option>
                    <option value="Referee">Referee</option>
                    <option value="Sports Medicine">Sports Medicine</option>
                </select>
            </li>
            <li>
                <label for="FavoriteSport">Favorite Sport<span class="rq">* </span></label>
                <select id="ddlFavorites" data-placeholder="Select Sport" class="chosen-select-nosearch sport" style="width: 241px;" data-bind="value: Results()[0].FavSports.SportsId" runat="server">
                    <option value=""></option>
                    <option value="Action sports">Action sports</option>
                    <option value="Aqua Fit">Aqua Fit</option>
                    <option value="Archery">Archery</option>
                    <option value="Badminton">Badminton</option>
                    <option value="Baseball">Baseball</option>
                    <option value="Basketball">Basketball</option>
                    <option value="Body Combat">Body Combat</option>
                    <option value="Body Pump">Body Pump</option>
                    <option value="Bowling">Bowling</option>
                    <option value="Boxing">Boxing</option>
                    <option value="Canoeing">Canoeing</option>
                    <option value="Cardio Jam">Cardio Jam</option>
                    <option value="Cardio Kickboxing">Cardio Kickboxing</option>
                    <option value="Cheerleading">Cheerleading</option>
                    <option value="Climbing">Climbing</option>
                    <option value="Cricket">Cricket</option>
                    <option value="Cross Country">Cross Country</option>
                    <option value="Cross Fit">Cross Fit</option>
                    <option value="Cycling">Cycling</option>
                    <option value="Fencing">Fencing</option>
                    <option value="Field Hockey">Field Hockey</option>
                    <option value="Figure Skating">Figure Skating</option>
                    <option value="Fishing">Fishing</option>
                    <option value="Football">Football</option>
                    <option value="Golf">Golf</option>
                    <option value="Gymnastics">Gymnastics</option>
                    <option value="Hockey">Hockey</option>
                    <option value="Horse Racing">Horse Racing</option>
                    <option value="Hunting">Hunting</option>
                    <option value="Ice Hockey">Ice Hockey</option>
                    <option value="Ice Skating">Ice Skating</option>
                    <option value="Insanity">Insanity</option>
                    <option value="Jazzercise">Jazzercise</option>
                    <option value="Karate">Karate</option>
                    <option value="Kayaking">Kayaking</option>
                    <option value="Koga">Koga</option>
                    <option value="Lacross">Lacross</option>
                    <option value="Martial Arts">Martial Arts</option>
                    <option value="Motorsports">Motorsports</option>
                    <option value="Nascar">Nascar</option>
                    <option value="P90X">P90X</option>
                    <option value="Pilates">Pilates</option>
                    <option value="Ping Pong">Ping Pong</option>
                    <option value="Poker">Poker</option>
                    <option value="Race Walking">Race Walking</option>
                    <option value="Racquetball">Racquetball</option>
                    <option value="Road Running">Road Running</option>
                    <option value="Rowing">Rowing</option>
                    <option value="Rugby">Rugby</option>
                    <option value="Sailing">Sailing</option>
                    <option value="Shooting">Shooting</option>
                    <option value="Silver Sneakers (Seniors)">Silver Sneakers (Seniors)</option>
                    <option value="Skateboarding">Skateboarding</option>
                    <option value="Skating">Skating</option>
                    <option value="Skiing">Skiing</option>
                    <option value="Snowboarding">Snowboarding</option>
                    <option value="Soccer">Soccer</option>
                    <option value="Soccer">Softball</option>
                    <option value="Spin">Spin</option>
                    <option value="Squash">Squash</option>
                    <option value="Step Aerobics">Step Aerobics</option>
                    <option value="Surfing">Surfing</option>
                    <option value="Swimming">Swimming</option>
                    <option value="Swimming Track">Swimming Track</option>
                    <option value="Taebo">Taebo</option>
                    <option value="Tennis">Tennis</option>
                    <option value="Track and Field">Track and Field</option>
                    <option value="TRX Equipment">TRX Equipment</option>
                    <option value="Ujam">Ujam</option>
                    <option value="Volleyball">Volleyball</option>
                    <option value="Water Polo">Water Polo</option>
                    <option value="Weightlifting">Weightlifting</option>
                    <option value="Wrestling">Wrestling</option>
                    <option value="Yoga">Yoga</option>
                    <option value="Zumba">Zumba</option>
                </select>
            </li>
            <li style="display: none;">
                <label for="College">College</label>
                <input id="txtCollage" maxlength="50" type="text" data-bind="value: Results()[0].Collage" runat="server" />
            </li>
            <li style="display: none;">
                <label for="High School">High School</label>
                <input id="txtHighSchool" maxlength="50" type="text" data-bind="value: Results()[0].HighSchool" runat="server" />
            </li>
            <li style="display: none;">
                <label for="Middle School">Middle School</label>
                <input id="txtMiddleSchool" maxlength="50" type="text" data-bind="value: Results()[0].MiddleSchool" runat="server" />
            </li>

            <li>
                <label for="Awards">Awards & Championships</label>

                <select id="ddlAwards" name="ddlAwards" class="dropdown" size="10" multiple="false" runat="server" style="height: 50px" />

                <input type="text" name="awards" id="OtherddlAwards" />
                <label for="add_f" id="liAdd">
                    <img alt="" src="images/add1.png" onclick="addAwards()" title="Add Awards">
                </label>
                <label for="add_f" id="liEdit">
                    <img alt="" src="images/editform.png" onclick="EditAwards()" title="Edit Awards">
                </label>

                <label for="add_f" id="liUpdate" style="display: none;">
                    <img alt="" src="images/update.png" onclick="UpdateAwards()" title="Update Awards">
                </label>
                <label for="add_f" id="liCancel" style="display: none;">
                    <img alt="" src="images/cancelform.png" onclick="CancelAwards()" title="Cancel Awards">
                </label>
                <label for="add_f" id="liDelete">
                    <img alt="" src="images/deleteform.png" onclick="DeleteAwards()" title="Delete Awards">
                </label>
            </li>
            <li>
                <label for="TeamAssociations">Team Associations</label>
                <select id="ddlTeams" runat="server" data-placeholder="Select Teams" class="chosen-select" multiple style="width: 241px; height: 30px;"></select>
            </li>
            <li>
                <label for="logo">Profile Logo </label>
                <img id="imgProfile" src="" width="120" height="120" runat="server" style="margin: 5px 0" />
            </li>
            <li>
                <label for="logo1">&nbsp;</label>

                <input id="uploadProfileImageBoxFive" type="file" />
                <input id="uploadProfileImageBox" type="file" style="display: none;" />
                <input type="hidden" id="imageHidden" runat="server" />
            </li>

            <li style="width: 725px;">
                <asp:Button ID="btnDetailSubmit" runat="server" Text="Save" CssClass="btTxt submit" OnClientClick="return validateProfile(); " />
            </li>
        </ul>
    </div>
</section>
<div class="contactRow" style="display: none;">
    <div class="label">
        Group Associations
    </div>
    <div class="input">
        <input id="ddlGroups" runat="server"
            data-bind="options: Results()[0].Groups, optionsText: function (item) { return item.Name; }" />
    </div>
</div>
<%--<div id="panelProfile">




    <div class="contactRow">
        <div class="label">
        </div>
        <div style="float: left; font-size: 12px; color: #282828; margin-top: 5px;">
        </div>
    </div>

    <div class="contactRow2" style="float: left; margin: 20px 0 20px 393px; top: 0px;">
        <div class="image">
        </div>
        <div class="input" style="float: none;">
        </div>
    </div>

    <br />
    <br />
</div>
</div>--%>
<input type="hidden" id="hdAwards" runat="server" />
 <script type="text/javascript">

    var autoListConfig = {
        '.chosen-select': {},
        '.chosen-select-nosearch': { disable_search: false },
        '.chosen-select-deselect': { allow_single_deselect: true },
        '.chosen-select-no-single': { disable_search_threshold: 10 },
        '.chosen-select-no-results': { no_results_text: 'Oops, nothing found!' },
        '.chosen-select-width': { width: "95%" }
    }
    for (var selector in autoListConfig) {
        $(selector).chosen(autoListConfig[selector]);
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        var options = {
            //map: ".map_canvas",
            //details: ".details",
            //detailsAttribute: "data-geo"
        };

        if ($("#<%= txtPhone.ClientID %>").val() != "") {
            if ($("#<%= ddlCountries.ClientID %>").val() == "United States" || $("#<%= ddlCountries.ClientID %>").val() == "Canada") {
                $("#<%= ddlCarrier.ClientID %>").addClass("carrier");
            }
            
        }

        //$("#ContentPlaceHolder1_ProfileUpdateControl1_txtCity").geocomplete(options).bind("geocode:result", function (event, result) {
        //    //setTimeout(function () { $(".map_canvas").show(); }, 2000);
        //    var city = $("#ContentPlaceHolder1_ProfileUpdateControl1_txtCity").val();
        //    var index = city.lastIndexOf(",");
        //    var country = city.substring(index + 1);
        //    $('#ContentPlaceHolder1_ProfileUpdateControl1_ddlCountries').val($.trim(country)).trigger('chosen:updated');
        //    $('#ContentPlaceHolder1_ProfileUpdateControl1_ddlCountries').chosen().change();
        //});
        //$("#MainContentPlaceHolder_ProfileUpdateControl1_txtCity").geocomplete(options).bind("geocode:result", function (event, result) {
        //    //setTimeout(function () { $(".map_canvas").show(); }, 2000);
        //    var city = $("#MainContentPlaceHolder_ProfileUpdateControl1_txtCity").val();
        //    var index = city.lastIndexOf(",");
        //    var country = city.substring(index + 1);
        //    $('#MainContentPlaceHolder_ProfileUpdateControl1_ddlCountries').val($.trim(country)).trigger('chosen:updated');
        //    $('#MainContentPlaceHolder_ProfileUpdateControl1_ddlCountries').chosen().change();
        //});


        $("#<%= txtPhone.ClientID %>").change(function () {
            if ($("#<%= txtPhone.ClientID %>").val() != "") {
                if ($("#<%= ddlCountries.ClientID %>").val() == "United States" || $("#<%= ddlCountries.ClientID %>").val() == "Canada") {

                    $("#<%= ddlCarrier.ClientID %>").addClass("carrier");

                }
                else {
                    $("#<%= ddlCarrier.ClientID %>").removeClass("carrier");
                }
            }
            else {
                $("#<%= ddlCarrier.ClientID %>").removeClass("carrier");
            }
        });

    });

    function validateProfile() {

        var form = $("form");
        $.validator.setDefaults({ ignore: ":hidden:not(select)" })
        $.validator.addMethod(
        "sportzlyDate",
        function (value, element) {
            // put your own logic here, this is just a (crappy) example
            return value.match(/^(?:(0[1-9]|1[012])[\- \/.](0[1-9]|[12][0-9]|3[01])[\- \/.](19|20)[0-9]{2})$/);
        },
        "Please enter a valid date."
    );
        jQuery.validator.addMethod("phonenumber", function (value, element) {
            return this.optional(element) || /^[0-9\s]*$/i.test(value);
        }, "Please enter valid phone number");

        jQuery.validator.addMethod("agevalidation", function (value, element) {
            var arg = value.split('-');
            var day = arg[1];
            var month = arg[0];
            var year = arg[2];
            var age = 13;

            var mydate = new Date();
            mydate.setFullYear(year, month - 1, day);

            var currdate = new Date();
            currdate.setFullYear(currdate.getFullYear() - age);

            return currdate > mydate;

        }, "You must be at least 13 years of age.");

        $.validator.addClassRules("firstname", { required: true, messages: { required: "First Name is required." } });
        $.validator.addClassRules("lastname", { required: true, messages: { required: "Last Name is required." } });
        $.validator.addClassRules("gender", { required: true });
        $.validator.addClassRules("DOB", { required: true, sportzlyDate: true, agevalidation: true });
        $.validator.addClassRules("city", { required: true });
        $.validator.addClassRules("country", { required: true });
        $.validator.addClassRules("level", { required: true });
        $.validator.addClassRules("sport", { required: true });
        $.validator.addClassRules("role", { required: true });
        $.validator.addClassRules("carrier", { required: true });
        //$.validator.addClassRules("zip", { required: true });
        $.validator.addClassRules("phone", { phonenumber: true });
        $.validator.addClassRules("usa", { phonenumber: true, minlength: 10, maxlength: 10 });

        form.validate({
            focusInvalid: true,
            onkeyup: false,
            showErrors: function (errorMap, errorList) {
                if (errorList.length > 0)
                    showError({ Message: "Please enter all the required information.", Code: 100 }, "Error", true);
                this.defaultShowErrors();
            }
        });
        if (form.valid()) {
            var txt = "";
            $("#<%= ddlAwards.ClientID %> > option").each(function () {
                txt = txt + this.text + ";";
            });         
          
            $("#<%= hdAwards.ClientID %>").val(txt);
        }
        return form.valid();
    }

    function addAwards() {
        var awardValue = $("#OtherddlAwards").val();

        if (awardValue != "") {
            var awardsDdl = $("#<%= ddlAwards.ClientID %>");
            awardsDdl.append(new Option(awardValue, awardValue));
            $("#OtherddlAwards").val("");
            $('option', awardsDdl).prop('selected', 'selected');
        }
    }

    function EditAwards() {

        var awardsDdl = $("#<%= ddlAwards.ClientID %> option:selected");

        if ($(awardsDdl).text() != "") {
            $("#OtherddlAwards").val($(awardsDdl).text());
            $("#liAdd").hide();
            $("#liEdit").hide();
            $("#liDelete").hide();
            $("#liUpdate").show();
            $("#liCancel").show();
        }
        else {
            alert("Please select item first");
        }

    }
    function DeleteAwards() {
        var awardsDdl = $("#<%= ddlAwards.ClientID %> option:selected");
        if ($(awardsDdl).text() != "") {           
            $(awardsDdl).remove();
        }
        else {
            alert("Please select item first");
        }
    }

    function CancelAwards() {

        $("#OtherddlAwards").val("");
        $("#liAdd").show();
        $("#liEdit").show();
        $("#liDelete").show();
        $("#liUpdate").hide();
        $("#liCancel").hide();

    }

    function UpdateAwards() {

        var awardValue = $("#OtherddlAwards").val();
        var awardsDdl = $("#<%= ddlAwards.ClientID %>");
        if (awardValue != "") {
            $(awardsDdl).find('option:selected').text(awardValue);
            $("#OtherddlAwards").val("");
        }
        $("#liAdd").show();
        $("#liEdit").show();
        $("#liDelete").show();
        $("#liUpdate").hide();
        $("#liCancel").hide();

    }
</script>
