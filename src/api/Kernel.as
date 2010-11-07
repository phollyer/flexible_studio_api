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
		
		/**
		* This method is called by sub classes when a HWND is
		* not supplied as an argument or property when required.
		*
		* <p>The MISSING_HWND event type is then dispatched to any listeners so that
		* you can handle the error</p>
		* 
		* @private
		*/
		protected function missingHWND():void
		{
			sendMessage(SWFStudioEvent.MISSING_HWND);
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