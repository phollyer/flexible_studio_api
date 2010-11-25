package api
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import api.errors.SWFStudioError;
	import api.events.SWFStudioEvent;

	[Event(name="actionComplete" , type="api.events.SWFStudioEvent")]
	[Event(name="error" , type="api.errors.SWFStudioError")]
	
	[Bindable]
	/**
	 * SWF Studio API Base Class.
	 *
	 * <p>All Classes extend this class.
	 * This API is written in ActionScript 3.0 and is targeted at Version 3.8 of SWF Studio.</p>
	 * 
	 * <p>The purpose of this API is to provide a more convenient and
	 * intuitive way of accessing Northcode's SWF Studio API. Whilst 
	 * Northcode's API provides a host of extra features for Flash and Flex Applications, it
	 * can sometimes be a bit of a learning curve for new developers.</P>
	 *
	 * <p>Even experienced developers need to spend some time learning how
	 * the API functions with Callbacks, Result Objects, Error Handling etc.
	 * If a new developer joins an existing team/project, having to learn <b>how</b>
	 * SWF Studio works is not always desirable - although for an experienced developer
	 * it shouldn't really be a problem.</p>
	 *
	 * <p>However, the way in which results are retrieved from actions are not necessarily
	 * intuitive when compared with the standard method/event model which all developers
	 * should be accustomed to if they want to do anything of value with Flash/Flex.</p>
	 * 
	 * <p>Therefore, this API hides the <b>how</b> from the developer,
	 * removing that part of the learning curve and enabling the developer
	 * to concentrate on the <b>what</b> instead.
	 *
	 * Because the API provides a standard Object based approach to issuing
	 * commands and receiving results that any developer should be naturally
	 * accustomed to, the developer can just learn <b>which</b> Objects and Methods 
	 * are required to perform a specific task, and nothing more.</p>
	 * 
	 * <p>All SWF Studio methods are issued Asynchronously by this API so that the
	 * Flash Player is never stopped whilst a result is returned by SWF Studio.
	 * Once a result is received from SWF Studio, it is dispatched from the Class to any
	 * Event Listeners you may have set up.</p>
	 * 
	 * <p>SWF Studio will return all results as Strings which this API then Types correctly
	 * before being dispatched - if you are expecting a number, you get a number.</p>
	 *
	 * <p>All Classes map to the corresponding SWF Studio method. If a SWF Studio method
	 * returns a set of properties, these properties are available on the correspnding Class.
	 * The same properties are available on the result event dispatched by the Class.
	 * This provides you with two options for accessing results. On the Event, or the Class.
	 * The benefit of using the Class, is that the properties are Bindable.</p>
	 * 
	 * <p>Each Class in this API is Bindable, therefore, every result value that is returned
	 * by SWF Studio can be bound to by binding to the relevant property on the Class. 
	 * This provides many advantages when handling the data - for more information about
	 * using Bindings, please refer to a good ActionScript reference manual.</p>
	 *  
	 * <p>This Class contains Public Static Constants used throughout
	 * the API as well as Public Utility Methods used throughout to 
	 * check Types and Values.</p>
	 * 
	 * <p>Error handling is taken care of for you. All you need to do is
	 * to set up an Event Listener to listen for the Error. Just as you would
	 * with, say, <code>URLLoader</code>.</p>
	 * 
	 * <p>The Error Log [<code>SWFStudio.ERROR_LOG</code>] is collated inside this Class. 
	 * It is a Public Static Var and can therefore be accessed from anywhere
	 * inside your application.</p>
	 * 
	 * <p>Each individual Class will dispatch it's own Error Event. The
	 * Event will populate the Hierarchy Tree all the way up to here.
	 * Therefore, you can listen for individual specific errors on each Class, or
	 * you can create a single Error Handling Class which handles 
	 * all the Errors dispatched from this Class - or both.</p>
	 * 
	 * <p>One of the Major benefits of this API is that if Northcode change their
	 * API, you will not be affected at all once this API has been updated.
	 * Let's say Northcode move a method - as has been done in the past:</p>
	 * 
	 * <p><code>FileSys.fileSave</code> was moved to <code>App.showFileSave</code></p>
	 * 
	 * <p>If you then had any old or existing projects that needed to be re-built that used
	 * <code>FileSys.fileSave</code>, you would have to manually go into your projects and update
	 * them before they could be re-built. This could easily become a real pain if you were using
	 * the <code>FileSys.fileSave</code> method in many places, or on different frames in different FLAs.</p>
	 * 
	 * <p>However, if using this API, all that I would need to do is to add the new method,
	 * in this case <code>App.showFileSave</code>, and then point the 'old' Class in the API
	 * to the new Class for the new method. Job done, and no need for you to trawl through lines
	 * of code making corrections/updates. Also, because Northcode always mark a method as
	 * deprecated before removing it, there is always a time lag. This means that I will have
	 * plenty of time to make the adjustments before the method is removed completely.
	 * Anyone using this API will never need to worry about deprecated methods or changes
	 * that Northcode may make - providing it is not a major overhaul as happened once during
	 * the change from <code>fscommands</code> to the current API structure.</p>
	 * 
	 * <p><b>Disclaimer</b> : Whilst I will make every attempt
	 * to keep this API up to date with any future modifications
	 * to Northcode's SWF Studio API, I can not guarantee time frames
	 * due to constantly changing commitments. Any changes I make for
	 * my own use will be made available to all users immediately.</p>
	 * 
	 * <p>In any case, this is now Open Source, so you can either make your changes
	 * and either, keep them to yourself, or join in and push your changes to GitHub.</p>
	 *
	 * <p>Every Class follows the same consistent structure internally.
	 * This meant I was able to 'just write' the Classes without having
	 * to worry about whether each Class worked or not - if the first Class works
	 * then so should the rest due to following the same structure. There are
	 * too many Classes, and too little time, to actively test every single one. 
	 * The only reason a Class may not work is due to a typo. If you find a
	 * Class which does not work as expected, first check your code, and if
	 * you narrow it down to a Class in this API, let me know, and I will
	 * check the Class, and provide an 'immediate' fix.</p>
	 */
	public class Kernel extends EventDispatcher
	{
		/**
		* Represents *.* to define all files in a folder.
		*/
		public static const ALL_FILES:String = "*.*";
		
		/**
		* Represents \r to define a carriage return.
		*/
		public static const CR:String = "\r";
	
		/**
		* Represents , to define a comma.
		*/
		public static const COMMA:String = ",";
	
		/**
		* Represents \n to define a new line.
		*/
		public static const NEW_LINE:String = "\n";
		
		/**
		* Represents | to define the pipe character.
		*/
		public static const PIPE:String = "|";

		/**
		* Represents ? to define a question mark.
		*/
		public static const QUESTION:String = "?";

		/**
		* Represents \t to define a tab character.
		*/
		public static const TAB:String = "\t";
		
		/**
		* This static var is checked by all commands. Setting this value to <code>true</code>
		* will prevent all commands that have not yet executed from doing so.
		*
		* @default false
		*/
		public static var ALL_STOP:Boolean = false;
		
		/**
		* The in-built error log. This log will be maintained automatically.
		*
		* <p>Each new error encountered will be pushed to the front of the ArrayCollection.
		* Checking <code>ERROR_LOG.getItemAt(0)</code> will return the last error generated.</p>
		*/
		public static var ERROR_LOG:ArrayCollection = new ArrayCollection();
		
		/**
		* Constructor.
		*/
		public function Kernel(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		//	========================
		//
		//	METHODS
		//
		//	========================
		
		/**
		 * Static Method to reset the Error Log from anywhere inside 
		 * the Application.
		 */
		static public function RESET_ERROR_LOG():void
		{
			ERROR_LOG = new ArrayCollection();
		}

		/**
		* A call to a SWF Studio method has completed OK.
		*
		* <p> All SWF Studio Method Classes set this method as their Callback
		* function. All Classes should override <code>sendResult()</code> if they have
		* results to send out.</p>
		*
		* @private
		*/
		protected function actionComplete(r:Object, c:Object, e:Object):void
		{
			switch( r.success )
			{
				case true:
				     sendMessage(SWFStudioEvent.ACTION_COMPLETE);
				     sendResult(r);
				     break;
				case false:
				     dispatchError(c, e);
			}
		}
		
		/**
		 * Convert a String to a Boolean value.
		 * 
		 * @param stringValue String to evaluate to Boolean.
		 * 
		 * @return <code>true</code> if <code>stringValue</code>
		 * is equal to <code>'TRUE'</code>, <code>'True'</code>, or <code>'true'</code>.
		 * Any other value for <code>stringValue</code> will return <code>false</code>.
		 * 
		 * @private
		 */
		protected function checkBoolean( stringValue:String ):Boolean
		{
			var __a:Boolean = false;
			switch( stringValue )
			{
				case "TRUE":
				case "True":
				case "true":
					__a = true;
			}
			return __a;
		}

		/**
		 * An Error has occured so package the Error
		 * Data and send it out to any EventListeners.
		 *
		 * <p>This is used throughtout the API by all Classes when an Error has occurred.</p> 
		 * 
		 * <p>The data is dispatched as an Event of type
		 * <code>SWFStudioError.errorSTR</code>.</p>
		 * 
		 * @param c An Object passed into the callback function defining the Error Type and ID that occurred - should it happen.
		 * @param e An Object containing the Error details.
		 * 
		 * @private
		 */
		protected function dispatchError( c:Object, e:Object ):void
		{
			var errorItem:Object = new Object();
			errorItem = e;
			errorItem.type = c.errorSTR;
			errorItem.fullCode = c.code + "-" + e.code;		
			ERROR_LOG.addItem( errorItem );
			
			var error:SWFStudioError = new SWFStudioError(SWFStudioError.ERROR);
			error.code = c.code;
			error.command = e.command;
			error.errorItem = errorItem;
			error.errorLog = ERROR_LOG;
			dispatchEvent( error );
		}
		
		/**
		 * Compare two of anything, and return one. If the first item
		 * value is NULL, return the second item. If the first item
		 * is not NULL, return the first.
		 * 
		 * <p>This is used to compare properties of a Class with
		 * the parameters passed into the Class Method so that the user has
		 * the choice of setting the property on the Class, or passing
		 * it in as a parameter of the Method.</p>
		 * 
		 * <p>This enables you to choose how you set the Class
		 * Properties. The parameter passed into the method will override
		 * and reset the property on the Class.</p>
		 * 
		 * @param first The first item that will be returned if it is not NULL
		 * @param second The second item will be returned if <code>first</code>
		 * is equal to NULL, regardless of the value of <code>second</code>.
		 * 
		 * @return *
		 * 
		 * @private
		 */
		protected function compareAnything( first:* , second:* ):*
		{
			return compare(first, null, second);
		}
		
		/**
		 * Compare two Arrays, and return one. If the first Array
		 * value is NULL, return the second Array. If the first Array
		 * is not NULL, return the first.
		 * 
		 * <p>This Method is used to compare properties of a Class with
		 * the parameters passed into the Class Method so that the user has
		 * the choice of setting the property on the Class, or passing
		 * it in as a parameter of the Method.</p>
		 * 
		 * <p>This enables the developer to choose how they set the Class
		 * Properties. The parameter passed into the method will override
		 * and reset the property on the Class.</p>
		 * 
		 * @param first The first Array that will be returned if it is not NULL
		 * @param second The second Array will be returned if <code>first</code>
		 * is equal to NULL, regardless of the value of <code>second</code>.
		 * 
		 * @return Array
		 * 
		 * @private
		 */
		protected function compareArrays( first:Array , second:Array ):Array
		{
			return compare(first, null, second) as Array;
		}
		
		/**
		 * Compare two Numbers, and return one. If the first Number
		 * value is -1, return the second Number. If the first Number
		 * is not -1, return the first.
		 * 
		 * <p>This Method is used to compare properties of a Class with
		 * the parameters passed into the Class Method so that the user has
		 * the choice of setting the property on the Class, or passing
		 * it in as a parameter of the Method.</p>
		 * 
		 * <p>This enables the developer to choose how they set the Class
		 * Properties. The parameter passed into the method will override
		 * and reset the property on the Class.</p>
		 * 
		 * @param first The first Number that will be returned if it is not -1
		 * @param second The second Number will be returned if <code>first</code>
		 * is equal to -1, regardless of the value of <code>second</code>.
		 * 
		 * @return Number
		 * 
		 * @private
		 */
		protected function compareNumbers( first:Number , second:Number ):Number
		{
			return Number(compare(first, -1, second));
		}
		
		/**
		 * Compare two Objects, and return one. If the first Object
		 * value is NULL, return the second Object. If the first Object
		 * is not NULL, return the first.
		 * 
		 * <p>This is used to compare properties of a Class with
		 * the parameters passed into the Class Method so that the user has
		 * the choice of setting the property on the Class, or passing
		 * it in as a parameter of the Method.</p>
		 * 
		 * <p>This enables the developer to choose how they set the Class
		 * Properties. The parameter passed into the method will override
		 * and reset the property on the Class.</p>
		 * 
		 * @param first The first Object that will be returned if it is not NULL
		 * @param second The second Object will be returned if <code>first</code>
		 * is equal to NULL, regardless of the value of <code>second</code>.
		 * 
		 * @return Object
		 * 
		 * @private
		 */
		protected function compareObjects( first:Object , second:Object ):Object
		{
			return compare(first, null, second) as Object;
		}
		
		/**
		 * Compare two Strings, and return one. If the first String
		 * value is NULL, return the second String. If the first String
		 * is not NULL, return the first.
		 * 
		 * <p>This is used to compare properties of a Class with
		 * the parameters passed into the Class Method so that the user has
		 * the choice of setting the property on the Class, or passing
		 * it in as a parameter of the Method.</p>
		 * 
		 * <p>This enables the developer to choose how they set the Class
		 * Properties. The parameter passed into the method will override
		 * and reset the property on the Class.</p>
		 * 
		 * @param first The first String that will be returned if it is not NULL
		 * @param second The second String will be returned if <code>first</code>
		 * is equal to NULL, regardless of the value of <code>second</code>.
		 * 
		 * @return String
		 * 
		 * @private
		 */
		protected function compareStrings( first:String , second:String ):String
		{
			return String(compare(first, null, second));
		}
		
		/**
		 * Convert a Binary value to a Boolean where <code>0 = false</code>
		 * and <code>1 = true</code>. Actually, any value passed in other than
		 * <code>1</code> will return false.
		 * 
		 * @param i Integer value to evaluate to <code>true | false</code>
		 * 
		 * @return Boolean
		 * 
		 * @private
		 */
		protected function convertBinaryToBoolean( i:int ):Boolean
		{
			var __b:Boolean = false;
			switch( i )
			{
				case 1:
					__b = true;
			}
			return __b
		}
		
		/**
		 * Convert a Boolean value to Binary where <code>false = 0</code>
		 * and <code>true = 1</code>.
		 * 
		 * @param b The Boolean value to evaluate.
		 * 
		 * @return int
		 * 
		 * @private
		 */
		protected function convertBooleanToBinary( b:Boolean ):int
		{
			var __i:int = 0;
			switch( b )
			{
				case true:
					__i = 1;
			}
			return __i;
		}
		
		/**
		* Internal method used by public compare methods
		* in order to compare first param against compare value.
		* If the comparison fails, return the second param regardless
		* of its value.
		*
		* @private
		*/
		private function compare( first:*, compare:*, second:* ):*
		{
			switch( first != compare )
			{
				case true:
				     second = first;
			}
			
			return second;
		}

                // Missing Methods

		/**
		* This method is called by sub classes when a Alias is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_ALIAS event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingAlias():void
		{
			sendMessage(SWFStudioEvent.MISSING_ALIAS );
		}

		/**
		* This method is called by sub classes when a Application is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_APPLICATION event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingApplication():void
		{
			sendMessage(SWFStudioEvent.MISSING_APPLICATION );
		}

		/**
		* This method is called by sub classes when a Attrs is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_ATTRS event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingAttrs():void
		{
			sendMessage(SWFStudioEvent.MISSING_ATTRS );
		}

		/**
		* This method is called by sub classes when a Button is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_BUTTON event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingButton():void
		{
			sendMessage(SWFStudioEvent.MISSING_BUTTON );
		}

		/**
		* This method is called by sub classes when a Char is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_CHAR event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingChar():void
		{
			sendMessage(SWFStudioEvent.MISSING_CHAR );
		}

		/**
		* This method is called by sub classes when a Color is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_COLOR event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingColor():void
		{
			sendMessage(SWFStudioEvent.MISSING_COLOR );
		}
		
		/**
		* This method is called by sub classes when some Criteria is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_CRITERIA event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingCriteria():void
		{
			sendMessage(SWFStudioEvent.MISSING_CRITERIA);
		}
		
		/**
		* This method is called by sub classes when a Direction is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_DATA event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingData():void
		{
			sendMessage(SWFStudioEvent.MISSING_DATA);
		}

		/**
		* This method is called by sub classes when a Destination is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_DESTINATION event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingDestination():void
		{
			sendMessage(SWFStudioEvent.MISSING_DESTINATION );
		}
		
		/**
		* This method is called by sub classes when a Direction is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_DIRECTION event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingDirection():void
		{
			sendMessage(SWFStudioEvent.MISSING_DIRECTION);
		}

		/**
		* This method is called by sub classes when Drive is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_DRIVE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingDrive():void
		{
			sendMessage(SWFStudioEvent.MISSING_DRIVE );
		}

		/**
		* This method is called by sub classes when a DriveLetter is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_DRIVE_LETTER event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingDriveLetter():void
		{
			sendMessage(SWFStudioEvent.MISSING_DRIVE_LETTER );
		}
		
		/**
		* This method is called by sub classes when an Event is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_EVENT event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingEvent():void
		{
			sendMessage(SWFStudioEvent.MISSING_EVENT);
		}

		/**
		* This method is called by sub classes when ExistingFile is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_EXISTING_FILE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingExistingFile():void
		{
			sendMessage(SWFStudioEvent.MISSING_EXISTING_FILE );
		}

		/**
		* This method is called by sub classes when FieldName is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_FIELD_NAME event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingFieldName():void
		{
			sendMessage(SWFStudioEvent.MISSING_FIELD_NAME );
		}

		/**
		* This method is called by sub classes when File is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_FILE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingFile():void
		{
			sendMessage(SWFStudioEvent.MISSING_FILE );
		}
		
		/**
		* This method is called by sub classes when a FileObj is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_FILE_OBJ event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingFileOBJ():void
		{
			sendMessage(SWFStudioEvent.MISSING_FILE_OBJ);
		}

		/**
		* This method is called by sub classes when a Flag is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_FLAG event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingFlag():void
		{
			sendMessage(SWFStudioEvent.MISSING_FLAG );
		}

		/**
		* This method is called by sub classes when a Folder is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_FOLDER event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingFolder():void
		{
			sendMessage(SWFStudioEvent.MISSING_FOLDER );
		}

		/**
		* This method is called by sub classes when a FolderID is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_FOLDER_ID event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingFolderID():void
		{
			sendMessage(SWFStudioEvent.MISSING_FOLDER_ID );
		}
		
		/**
		* This method is called by sub classes when a Direction is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_FORMAT event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingFormat():void
		{
			sendMessage(SWFStudioEvent.MISSING_FORMAT);
		}

		/**
		* This method is called by sub classes when a FromPath is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_FROM_PATH event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingFromPath():void
		{
			sendMessage(SWFStudioEvent.MISSING_FROM_PATH );
		}
		
		/**
		* This method is called by sub classes when a HWND is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSINGHWND event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingHWND():void
		{
			sendMessage(SWFStudioEvent.MISSINGHWND);
		}

		/**
		* This method is called by sub classes when a Headers is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSINGHEADERS event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingHeaders():void
		{
			sendMessage(SWFStudioEvent.MISSINGHEADERS );
		}

		/**
		* This method is called by sub classes when a Height is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSINGHEIGHT event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingHeight():void
		{
			sendMessage(SWFStudioEvent.MISSINGHEIGHT );
		}

		/**
		* This method is called by sub classes when HighValue is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSINGHIGH_VALUE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingHighValue():void
		{
			sendMessage(SWFStudioEvent.MISSINGHIGH_VALUE );
		}

		/**
		* This method is called by sub classes when a Host is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSINGHOST event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingHost():void
		{
			sendMessage(SWFStudioEvent.MISSINGHOST );
		}

		/**
		* This method is called by sub classes when a Hwnd is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSINGHWND event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingHwnd():void
		{
			sendMessage(SWFStudioEvent.MISSINGHWND );
		}

		/**
		* This method is called by sub classes when a ID is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSINGID event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingID():void
		{
			sendMessage(SWFStudioEvent.MISSINGID );
		}

		/**
		* This method is called by sub classes when a Index is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSINGINDEX event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingIndex():void
		{
			sendMessage(SWFStudioEvent.MISSINGINDEX );
		}

		/**
		* This method is called by sub classes when a Item is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSINGITEM event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingItem():void
		{
			sendMessage(SWFStudioEvent.MISSINGITEM );
		}

		/**
		* This method is called by sub classes when a Jpeg is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_JPEG event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingJpeg():void
		{
			sendMessage(SWFStudioEvent.MISSING_JPEG );
		}

		/**
		* This method is called by sub classes when a Key is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_KEY event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingKey():void
		{
			sendMessage(SWFStudioEvent.MISSING_KEY );
		}

		/**
		* This method is called by sub classes when Language is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_LANGUAGE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingLanguage():void
		{
			sendMessage(SWFStudioEvent.MISSING_LANGUAGE );
		}

		/**
		* This method is called by sub classes when LowValue is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_LOW_VALUE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingLowValue():void
		{
			sendMessage(SWFStudioEvent.MISSING_LOW_VALUE );
		}

		/**
		* This method is called by sub classes when Message is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_MESSAGE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingMessage():void
		{
			sendMessage(SWFStudioEvent.MISSING_MESSAGE );
		}
		
		/**
		* This method is called by sub classes when a Method name is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_METHOD event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingMethod():void
		{
			sendMessage(SWFStudioEvent.MISSING_METHOD);
		}

		/**
		* This method is called by sub classes when Module is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_MODULE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingModule():void
		{
			sendMessage(SWFStudioEvent.MISSING_MODULE );
		}

		/**
		* This method is called by sub classes when Name is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_NAME event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingName():void
		{
			sendMessage(SWFStudioEvent.MISSING_NAME );
		}

		/**
		* This method is called by sub classes when NewFile is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_NEW_FILE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingNewFile():void
		{
			sendMessage(SWFStudioEvent.MISSING_NEW_FILE );
		}

		/**
		* This method is called by sub classes when NewName is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_NEWNAME event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingNewName():void
		{
			sendMessage(SWFStudioEvent.MISSING_NEWNAME );
		}
		
		/**
		* This method is called by sub classes when a Number is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_NUMBER event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingNumber():void
		{
			sendMessage(SWFStudioEvent.MISSING_NUMBER);
		}
		
		/**
		* This method is called by sub classes when an Object reference is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_OBJECT event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingObject():void
		{
			sendMessage(SWFStudioEvent.MISSING_OBJECT);
		}

		/**
		* This method is called by sub classes when a Offset is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_OFFSET event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingOffset():void
		{
			sendMessage(SWFStudioEvent.MISSING_OFFSET );
		}

		/**
		* This method is called by sub classes when a Orientation is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_ORIENTATION event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingOrientation():void
		{
			sendMessage(SWFStudioEvent.MISSING_ORIENTATION );
		}

		/**
		* This method is called by sub classes when a Password is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PASSWORD event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingPassword():void
		{
			sendMessage(SWFStudioEvent.MISSING_PASSWORD );
		}
		
		/**
		* This method is called by sub classes when a Path is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PATH event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingPath():void
		{
			sendMessage(SWFStudioEvent.MISSING_PATH);
		}

		/**
		* This method is called by sub classes when a Pattern is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PATTERN event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingPattern():void
		{
			sendMessage(SWFStudioEvent.MISSING_PATTERN );
		}

		/**
		* This method is called by sub classes when a Percent is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PERCENT event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingPercent():void
		{
			sendMessage(SWFStudioEvent.MISSING_PERCENT );
		}

		/**
		* This method is called by sub classes when a Plugin is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PLUGIN event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingPlugin():void
		{
			sendMessage(SWFStudioEvent.MISSING_PLUGIN );
		}

		/**
		* This method is called by sub classes when a Port is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PORT event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingPort():void
		{
			sendMessage(SWFStudioEvent.MISSING_PORT );
		}
		
		/**
		* This method is called by sub classes when a Priority is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PRIORITY event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingPriority():void
		{
			sendMessage(SWFStudioEvent.MISSING_PRIORITY);
		}

		/**
		* This method is called by sub classes when a ProcessId is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PROCESS_ID event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingProcessId():void
		{
			sendMessage(SWFStudioEvent.MISSING_PROCESS_ID );
		}		
		
		/**
		* This method is called by sub classes when a ProgID is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PROG_ID event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingProgID():void
		{
			sendMessage(SWFStudioEvent.MISSING_PROG_ID);
		}
		
		/**
		* This method is called by sub classes when a Prompt is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PROMPT event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingPrompt():void
		{
			sendMessage(SWFStudioEvent.MISSING_PROMPT);
		}
		
		/**
		* This method is called by sub classes when a Property is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PROPERTY event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingProperty():void
		{
			sendMessage(SWFStudioEvent.MISSING_PROPERTY);
		}

		/**
		* This method is called by sub classes when a Pswd is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_PSWD event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingPswd():void
		{
			sendMessage(SWFStudioEvent.MISSING_PSWD );
		}

		/**
		* This method is called by sub classes when a Quality is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_QUALITY event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingQuality():void
		{
			sendMessage(SWFStudioEvent.MISSING_QUALITY );
		}

		/**
		* This method is called by sub classes when a RemotePath is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_REMOTE_PATH event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingRemotePath():void
		{
			sendMessage(SWFStudioEvent.MISSING_REMOTE_PATH );
		}

		/**
		* This method is called by sub classes when Resource is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_RESOURCE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingResource():void
		{
			sendMessage(SWFStudioEvent.MISSING_RESOURCE );
		}

		/**
		* This method is called by sub classes when a RootKey is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_ROOT_KEY event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingRootKey():void
		{
			sendMessage(SWFStudioEvent.MISSING_ROOT_KEY );
		}

		/**
		* This method is called by sub classes when RootValue is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_ROOT_VALUE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingRootValue():void
		{
			sendMessage(SWFStudioEvent.MISSING_ROOT_VALUE );
		}
		
		/**
		* This method is called by sub classes when some SQL is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_SQL event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingSQL():void
		{
			sendMessage(SWFStudioEvent.MISSING_SQL);
		}

		/**
		* This method is called by sub classes when a Section is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_SECTION event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingSection():void
		{
			sendMessage(SWFStudioEvent.MISSING_SECTION );
		}

		/**
		* This method is called by sub classes when a Server is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_SERVER event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingServer():void
		{
			sendMessage(SWFStudioEvent.MISSING_SERVER );
		}

		/**
		* This method is called by sub classes when ShortcutFile is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_SHORTCUT_FILE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingShortcutFile():void
		{
			sendMessage(SWFStudioEvent.MISSING_SHORTCUT_FILE );
		}

		/**
		* This method is called by sub classes when Source is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_SOURCE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingSource():void
		{
			sendMessage(SWFStudioEvent.MISSING_SOURCE );
		}
		
		/**
		* This method is called by sub classes when a String is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_STRING event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingString():void
		{
			sendMessage(SWFStudioEvent.MISSING_STRING);
		}

		/**
		* This method is called by sub classes when a SubKey is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_SUB_KEY event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingSubKey():void
		{
			sendMessage(SWFStudioEvent.MISSING_SUB_KEY );
		}

		/**
		* This method is called by sub classes when SubValue is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_SUB_VALUE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingSubValue():void
		{
			sendMessage(SWFStudioEvent.MISSING_SUB_VALUE );
		}
		
		/**
		* This method is called by sub classes when Text is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_TEXT event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingText():void
		{
			sendMessage(SWFStudioEvent.MISSING_TEXT);
		}

		/**
		* This method is called by sub classes when a ToAddress is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_TO_ADDRESS event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingToAddress():void
		{
			sendMessage(SWFStudioEvent.MISSING_TO_ADDRESS );
		}

		/**
		* This method is called by sub classes when a ToPath is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_TO_PATH event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingToPath():void
		{
			sendMessage(SWFStudioEvent.MISSING_TO_PATH );
		}

		/**
		* This method is called by ed by sub classes when a User is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_USER event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingUser():void
		{
			sendMessage(SWFStudioEvent.MISSING_USER );
		}

		/**
		* This method is called by sub classes when a UserAgent is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_USER_AGENT event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingUserAgent():void
		{
			sendMessage(SWFStudioEvent.MISSING_USER_AGENT );
		}

		/**
		* This method is called by sub classes when a UserID is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_USER_ID event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingUserID():void
		{
			sendMessage(SWFStudioEvent.MISSING_USER_ID );
		}
		
		/**
		* This method is called by sub classes when a Value is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_VALUE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingValue():void
		{
			sendMessage(SWFStudioEvent.MISSING_VALUE);
		}

		/**
		* This method is called by sub classes when ValueName is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_VALUE_NAME event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingValueName():void
		{
			sendMessage(SWFStudioEvent.MISSING_VALUE_NAME );
		}

		/**
		* This method is called by sub classes when Variable is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_VARIABLE event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingVariable():void
		{
			sendMessage(SWFStudioEvent.MISSING_VARIABLE );
		}

		/**
		* This method is called by sub classes when a Vars is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_VARS event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingVars():void
		{
			sendMessage(SWFStudioEvent.MISSING_VARS );
		}

		/**
		* This method is called by sub classes when a Width is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_WIDTH event type is then dispatched to any listeners so that
		* you can handle the error</p>
		*
		* @private
		*/
		protected function missingWidth():void
		{
			sendMessage(SWFStudioEvent.MISSING_WIDTH );
		}
		

		/**
		* Send an event out to any listeners of type <code>eventType</code>
		*
		* @param eventType The type of SWFStudioEvent to dispatch.
		*
		* @private
		*/
		private function sendMessage( eventType:String ):void
		{
			var e : SWFStudioEvent = new SWFStudioEvent(eventType);
			dispatchEvent(e);
		}

		/**
		* This method should be called when a SWF Studio action
		* has completed successfully.
		*
		* <p>This method should be overridden by sub classes in
		* order to dispatch Class specific data</p>
		*
		* @param r The result Object returned by SWFStudio.
		*
		* @private
		* 
                * @private
		*/
		protected function sendResult(r:Object):void
		{
		}
	}			
}