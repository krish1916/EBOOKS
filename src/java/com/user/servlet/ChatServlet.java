/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

/**
 *
 * @author rik
 */
@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet{

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String message = request.getParameter("message");
        String chatGPTResponse = getChatGPTResponse(message);
        response.getWriter().write(chatGPTResponse);
    }

   private String getChatGPTResponse(String message) {
    String apiUrl = "https://api.openai.com/v1/completions";
    String apiKey = ""; // Replace with your actual API key

    // Request body JSON
    String requestBody = "{\"model\": \"gpt-3.5-turbo-0613\", \"engine\": \"text-davinci-003\", \"prompt\": \"" + message + "\", \"max_tokens\": 250}";

    // Initialize HttpClient
    try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
        // Create HTTP POST request
        HttpPost httpPost = new HttpPost(apiUrl);
        httpPost.addHeader("Authorization", "Bearer " + apiKey);
        httpPost.addHeader("Content-Type", "application/json");
        httpPost.setEntity(new StringEntity(requestBody));

        // Execute the request
        try (CloseableHttpResponse httpResponse = httpClient.execute(httpPost)) {
            // Get response entity
            HttpEntity responseEntity = httpResponse.getEntity();

            // Parse and return response
            if (responseEntity != null) {
                String responseBody = EntityUtils.toString(responseEntity);
                return parseChatGPTResponse(responseBody);
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "Error processing response";
        }
    } catch (IOException e) {
        e.printStackTrace();
        return "Error connecting to ChatGPT API";
    }

    return "Error processing request";
}

    private String parseChatGPTResponse(String responseBody) {
        // Parse the JSON response and extract the generated text
        // Adjust this based on the response format of the ChatGPT API
        // For simplicity, returning the entire response body as the result
        return responseBody;
    }
    
    
    
}
